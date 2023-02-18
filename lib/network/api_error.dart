import 'package:dio/dio.dart';

/// Helper class for converting [DioError] into readable formats

class ApiError {
  int? errorType = 0;
  ApiErrorModel? apiErrorModel;

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = 'DIO_ERROR_CANCEL';
          break;
        case DioErrorType.connectTimeout:
          errorDescription = 'DIO_ERROR_CONNECT_TIMEOUT';
          break;
        case DioErrorType.other:
          errorDescription = 'DIO_ERROR_DEFAULT';
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = 'DIO_ERROR_RECEIVE_TIMEOUT';
          break;
        case DioErrorType.response:
          this.errorType = dioError.response!.statusCode;
          if (dioError.response!.statusCode == 401) {
            this.errorDescription = 'SESSION_TIME_OUT';
          } else if (dioError.response!.statusCode == 400) {
            this.apiErrorModel =
                ApiErrorModel.fromJson(dioError.response!.data);
            this.errorDescription =
                extractDescriptionFromResponse(error.response);
          } else {
            this.errorDescription = 'DIO_ERROR_RESPONSE';
          }
          break;
        case DioErrorType.sendTimeout:
          errorDescription = 'DIO_ERROR_DEFAULT';
          break;
      }
    } else {
      errorDescription = 'GENERAL_ERROR';
    }
  }

  String extractDescriptionFromResponse(Response? response) {
    String? message = "";
    try {
      if (response?.data != null && response!.data["message"] != null) {
        message = response.data["message"];
      } else {
        message = response!.statusMessage;
      }
    } catch (error, stackTrace) {
      message = response?.statusMessage ?? error.toString();
    }
    return message!;
  }

  @override
  String toString() => '$errorDescription';
}

class ApiErrorModel {
  int? code;
  ZError? error;
  String? message;
  dynamic data;
  bool? success;

  ApiErrorModel({
    this.code,
    this.error,
    this.message,
    this.success,
    this.data,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        code: json["code"],
        data: json["data"],
        //error: Error.fromJson(json["error"]),
        message: json["message"],
        success: json["success"],
      );
}

class ZError {
  String? devMessage;
  String? possibleSolution;
  String? exceptionError;
  String? userMessage;
  int? errorCode;
  int? statusCode;

  ZError({
    this.devMessage,
    this.possibleSolution,
    this.exceptionError,
    this.userMessage,
    this.errorCode,
    this.statusCode,
  });

  factory ZError.fromJson(Map<String, dynamic> json) => ZError(
        devMessage: json["devMessage"],
        possibleSolution: json["possibleSolution"],
        exceptionError: json["exceptionError"],
        userMessage: json["userMessage"],
        errorCode: json["errorCode"],
        statusCode: json["statusCode"],
      );
}
