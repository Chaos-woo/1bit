import 'package:dio/dio.dart';

class ApiError implements Exception {
  String? message;
  int? httpCode;
  String? details;

  ApiError([this.httpCode, this.message]);

  static const int internal = -1;

  factory ApiError.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ApiError(internal, error.message);
      case DioErrorType.response:
        try {
          int? httpStatusCode = error.response?.statusCode;
          switch (httpStatusCode) {
            case 400:
              return BadRequestException();
            case 401:
            case 403:
            case 404:
            case 405:
              return UnauthorisedException();
            case 500:
            case 502:
            case 503:
            case 505:
              return ApiServerException();
            default:
              return ApiError(
                httpStatusCode,
                error.response?.statusMessage ?? 'ApiError: ${error.message}',
              );
          }
        } on Exception {
          return ApiError(internal, 'ApiError: ${error.message}');
        }
      default:
        return ApiError(internal, error.message);
    }
  }

  factory ApiError.create(dynamic ex) {
    if (ex is DioError) {
      return ApiError.fromDioError(ex);
    }
    if (ex is ApiError) {
      return ex;
    } else {
      var other = ApiError(-1, 'Other');
      other.details = ex?.toString();
      return other;
    }
  }
}

/// 请求错误
class BadRequestException extends ApiError {
  BadRequestException(
      [super.code = ApiError.internal, super.message = 'BadRequest']);
}

/// 未认证异常
class UnauthorisedException extends ApiError {
  UnauthorisedException(
      [int super.code = ApiError.internal,
      String super.message = 'Unauthorised']);
}

/// 未认证异常
class ApiServerException extends ApiError {
  ApiServerException(
      [int super.code = ApiError.internal,
      String super.message = 'ApiServerError']);
}
