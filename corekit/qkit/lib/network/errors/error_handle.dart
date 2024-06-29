import 'package:dio/dio.dart';
import 'package:qkit/log/pplog.dart';

/// 网络异常非响应错误处理器
abstract class DioErrorHandle {
  Function(DioError error)? handle;

  DioErrorHandle({this.handle});

  List<DioErrorType> get errors;

  bool match(DioErrorType errorType) {
    return errors.any((error) => error == errorType);
  }
}

/// 网络请求响应错误处理器
abstract class DioResponseErrorHandle {
  Function(String? responseStatusMessage)? handle;

  DioResponseErrorHandle({this.handle});

  List<int> get httpStatusCodes;

  bool match(int httpStatus) {
    return httpStatusCodes.any((status) => status == httpStatus);
  }
}

/// 默认处理器
class DefaultDioErrorHandle extends DioErrorHandle {
  DefaultDioErrorHandle()
      : super(handle: (error) {
          PPLog.singl.info(error.message);
        });

  @override
  List<DioErrorType> get errors => [
        DioErrorType.cancel,
        DioErrorType.connectTimeout,
        DioErrorType.sendTimeout,
        DioErrorType.receiveTimeout,
      ];
}

/// 默认处理器
class DefaultDioResponseErrorHandle extends DioResponseErrorHandle {
  DefaultDioResponseErrorHandle(): super(handle: (errorMessage) {
    PPLog.singl.info(errorMessage);
  });

  @override
  List<int> get httpStatusCodes => throw UnimplementedError();
}
