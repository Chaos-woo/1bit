import 'package:dio/dio.dart';
import 'package:qkit/qkit.dart';

/// 超时拦截器
class DefaultTimeoutInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map extra = options.extra;
    // Header有指定字段名的连接超时、读超时时，单独指定和设置本次请求
    if (extra.containsKey(HttpConstant.connectTimeout)) {
      int connectTimeout = options.extra[HttpConstant.connectTimeout];
      options.connectTimeout = connectTimeout;
    }
    if (extra.containsKey(HttpConstant.readTimeout)) {
      int readTimeout = options.extra[HttpConstant.readTimeout];
      options.receiveTimeout = readTimeout;
    }
    super.onRequest(options, handler);
  }
}
