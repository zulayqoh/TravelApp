import 'package:dio/dio.dart';

import 'package:travel_app_sample/network/url_config.dart';

import '../app_model/file_upload_progress.dart';
import '../app_source.dart';
import '../data_base/session_manager.dart';
import '../helpers/error_reporter.dart';
import '../helpers/events.dart';
import 'api_error.dart';
import 'app_interceptor.dart';

/// description: A network provider class which manages network connections
/// between the app and external services. This is a wrapper around [Dio].
///
/// Using this class automatically handle, token management, logging, global
/// interceptors and general parameters such as country and language.
///

class NetworkProvider {
  static const int CONNECT_TIME_OUT = 60000;
  static const int RECEIVE_TIME_OUT = 60000;
  late Dio dio;
  String? baseUrl, authToken;
  bool? addGeneralParam;

  NetworkProvider(
      {String? baseUrl,
      String? authToken,
      bool? addGeneralParam,
      bool showLog = false}) {
    this.baseUrl = baseUrl ?? "";
    this.authToken = authToken ?? "";
    this.addGeneralParam = addGeneralParam ?? false;
    _initialiseDio(showLog);
  }

  /// Initialize essential class properties
  void _initialiseDio(bool showLog) {
    dio = Dio(BaseOptions(
      connectTimeout: CONNECT_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
      baseUrl: baseUrl ?? UrlConfig.coreBaseUrl!,
    ));
    authToken ??= SessionManager.instance.authToken;
    dio.interceptors..add(AppInterceptor(authToken!));

    if (showLog)
      dio.interceptors
          .add(LogInterceptor(requestBody: true, logPrint: printDioLogs));
  }

  factory NetworkProvider.forRefreshToken({bool? showLog}) {
    final dio = Dio(BaseOptions(
        connectTimeout: CONNECT_TIME_OUT,
        receiveTimeout: RECEIVE_TIME_OUT,
        baseUrl: "mark.bslmeiyu.com/api/getplaces",
        headers: {
          "Authorization": "Bearer ${SessionManager.instance.authToken}"
        }));
    if (showLog ?? false)
      dio.interceptors.add(LogInterceptor(logPrint: printDioLogs));
    return NetworkProvider._internal(dio: dio);
  }

  /// Factory constructor used mainly for injecting an instance of [Dio] mock
  NetworkProvider.test(this.dio);

  NetworkProvider._internal({required this.dio});

  Future<Response> call(
    String path,
    RequestMethod method, {
    Map<String, dynamic>? queryParams,
    data,
    FormData? formData,
    ResponseType responseType = ResponseType.json,
    String? classTag = '',
    bool? showLog,
  }) async {
    // _initialiseDio();
    Response response;
    var params = queryParams ?? {};
    if (this.addGeneralParam ?? false) params.addAll(requiredParams);
    if (params.keys.contains("searchTerm")) {
      params["searchTerm"] = Uri.encodeQueryComponent(params["searchTerm"]);
    }
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio.post(path,
              queryParameters: params,
              data: data,
              options: Options(responseType: responseType));
          break;
        case RequestMethod.get:
          response = await dio.get(path, queryParameters: params);
          break;
        case RequestMethod.put:
          response = await dio.put(path, queryParameters: params, data: data);
          break;
        case RequestMethod.delete:
          response =
              await dio.delete(path, queryParameters: params, data: data);
          break;
        case RequestMethod.upload:
          response = await dio.post(path,
              data: formData,
              queryParameters: params,
              options: new Options(headers: {
                "Authorization": "Bearer " + SessionManager.instance.authToken,
                "Apptoken": SessionManager.instance.appToken,
                "Content-Disposition": "form-data",
                "Content-Type": "multipart/form-data",
              }), onSendProgress: (sent, total) {
            eventBus.fire(FileUploadProgressEvent(
                FileUploadProgress(sent, total, tag: classTag)));
          });
          break;
      }
      if (showLog ?? false) print("API response: $response");
      return response;
    } catch (error, stackTrace) {
      if (UrlConfig.isProdEnvironment) {
        ErrorReporter().reportError(error, stackTrace);
      }
      if ((showLog ?? false) && error is DioError) {
        print("$path - status code: ${error.response?.statusCode}");
        print("API response: ${error.response}");
      }
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        eventBus.fire(LogoutEvent("just log out out of here pls"));
      }
      return Future.error(apiError, stackTrace);
    }
  }

  Future<Response<List<int>>> callWithByteResponse(String path,
      {Map<String, dynamic>? queryParams, data}) async {
    try {
      return await dio.post(path,
          queryParameters: queryParams,
          data: data,
          options: Options(responseType: ResponseType.bytes));
    } catch (err, stackTrace) {
      if (UrlConfig.isProdEnvironment) {
        ErrorReporter().reportError(err, stackTrace);
      }
      return Future.error(ApiError.fromDio(err), stackTrace);
    }
  }

  Map<String, dynamic> get requiredParams {
    var params = {"language": SessionManager.instance.languageCode};
    if (SessionManager.instance.country.isNotEmpty &&
        SessionManager.instance.country.toLowerCase() != "global") {
      params.addAll({"country": SessionManager.instance.country});
    }
    return params;
  }
}

enum RequestMethod { post, get, put, delete, upload }
