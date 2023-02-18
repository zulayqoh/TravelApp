import 'dart:async';

import 'package:dio/dio.dart';

import '../app_source.dart';
import '../data_base/session_manager.dart';
import '../helpers/events.dart';
import '../utils/app_config.dart';
import 'jwt_decoder.dart' as JWT;
import 'network_provider.dart';

/// [Interceptor] extension for setting token header
/// and other required properties for all requests

class AppInterceptor extends Interceptor {
  String authToken;

  AppInterceptor(this.authToken);

  /// sets the auth token and Apptoken
  /// Apptoken is an identify for each app
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String authToken = SessionManager.instance.authToken;

    if (authToken.isNotEmpty) {
      if (JWT.JwtDecoder.isExpired(authToken)) {
        authToken = await revalidateToken();
      }
      options.headers.addAll({
        "Authorization": "Bearer " + authToken,
      });
    }
    options.headers.addAll({"Apptoken": SessionManager.instance.appToken});
    return super.onRequest(options, handler);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 400) {
      response.statusCode = 200;
    } else if (response.statusCode == 401) {
      eventBus.fire(LogoutEvent(""));
    }
    return super.onResponse(response, handler);
  }

  Future<String> revalidateToken() async {
    try {
      String url = AppConfig.revalidateTokenUrl;
      var response = await NetworkProvider.forRefreshToken().call(
          url, RequestMethod.post, data: {
        "token": SessionManager.instance.authToken,
        "duration": 31557600
      });
      final authToken = response.data["data"]["token"];
      SessionManager.instance.authToken = authToken;
      return authToken;
    } catch (error) {
      rethrow;
    }
  }
}
