import 'package:cw2bit/infra/a_net/value/api_value.dart';
import 'package:dio/dio.dart';

class INKApiResult {
  dynamic content;
  Exception? error;
  StackTrace? stackTrace;

  INKApiResult._();

  INKApiResult.data(this.content);

  INKApiResult.error(this.error, this.stackTrace) {
    content = null;
  }

  T transformerData<T>(T Function(Map<String, dynamic>) transformer) {
    if (content is T) {
      return content;
    }
    return transformer(content as Map<String, dynamic>);
  }

  T as<T>() => content as T;

  bool get isError => error != null;

  bool get isDioError => error is DioException;

  void handle<T>({
    required void Function(T data) onSuccess,
    T Function(Map<String, dynamic>)? dataTransformer,
    void Function(DioException error, StackTrace? stackTrace)? onConnectionTimeoutError,
    void Function(DioException error, StackTrace? stackTrace)? onSendTimeoutError,
    void Function(DioException error, StackTrace? stackTrace)? onReceiveTimeoutError,
    void Function(DioException error, StackTrace? stackTrace)? onBadCertificateError,
    void Function(DioException error, StackTrace? stackTrace)? onCancelError,
    void Function(DioException error, StackTrace? stackTrace)? onConnectionError,
    void Function(DioException error, StackTrace? stackTrace)? onUnknownError,
    void Function(DioException error, StackTrace? stackTrace)? onHttp400Error,
    void Function(DioException error, StackTrace? stackTrace)? onHttp401Error,
    void Function(DioException error, StackTrace? stackTrace)? onHttp403Error,
    void Function(DioException error, StackTrace? stackTrace)? onHttp404Error,
    void Function(DioException error, StackTrace? stackTrace)? onHttp408Error,
    void Function(DioException error, StackTrace? stackTrace)? onHttp500Error,
    void Function(DioException error, StackTrace? stackTrace)? onHttp502Error,
    void Function(DioException error, StackTrace? stackTrace)? onHttp503Error,
    void Function(DioException error, StackTrace? stackTrace)? onHttp504Error,
    void Function(String errCode, String errMsg, DioException error, StackTrace? stackTrace)? onCodeError,
    void Function(Exception error, StackTrace? stackTrace)? onError,
  }) {
    if (isError) {
      if (isDioError) {
        var err = error! as DioException;
        switch (err.type) {
          case DioExceptionType.connectionTimeout:
            onConnectionTimeoutError?.call(err, stackTrace);
            break;
          case DioExceptionType.sendTimeout:
            onSendTimeoutError?.call(err, stackTrace);
            break;
          case DioExceptionType.receiveTimeout:
            onReceiveTimeoutError?.call(err, stackTrace);
            break;
          case DioExceptionType.badCertificate:
            onBadCertificateError?.call(err, stackTrace);
            break;
          case DioExceptionType.cancel:
            onCancelError?.call(err, stackTrace);
            break;
          case DioExceptionType.connectionError:
            onConnectionError?.call(err, stackTrace);
            break;
          case DioExceptionType.unknown:
            onUnknownError?.call(err, stackTrace);
            break;
          case DioExceptionType.badResponse:
            {
              switch (err.response?.statusCode) {
                case 200:
                  var errCode = err.response?.extra[kLocalApiErrorTypeCode];
                  if (errCode == localApiErrorCode) {
                    onError?.call(error!, stackTrace);
                  } else {
                    String errMsg = (err.error is String) ? err.error as String : '未知错误';
                    onCodeError?.call(errCode, errMsg, err, stackTrace);
                  }
                  break;
                case 400:
                  onHttp400Error?.call(err, stackTrace);
                  break;
                case 401:
                  onHttp401Error?.call(err, stackTrace);
                  break;
                case 403:
                  onHttp403Error?.call(err, stackTrace);
                  break;
                case 404:
                  onHttp404Error?.call(err, stackTrace);
                  break;
                case 408:
                  onHttp408Error?.call(err, stackTrace);
                  break;
                case 500:
                  onHttp500Error?.call(err, stackTrace);
                  break;
                case 502:
                  onHttp502Error?.call(err, stackTrace);
                  break;
                case 503:
                  onHttp503Error?.call(err, stackTrace);
                  break;
                case 504:
                  onHttp504Error?.call(err, stackTrace);
                  break;
              }
            }
        }
      } else {
        onError?.call(error!, stackTrace);
      }
    } else {
      var data;
      if (dataTransformer != null) {
        data = transformerData(dataTransformer);
      } else {
        data = data as T;
      }
      onSuccess(data);
    }
  }
}
