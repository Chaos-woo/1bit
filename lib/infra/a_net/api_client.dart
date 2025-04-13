import 'dart:async';
import 'dart:convert';

import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_net/api_result.dart';
import 'package:cw2bit/infra/a_net/http_request_option.dart';
import 'package:dio/dio.dart';

final class _HttpMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class INKApiClient {
  late final Dio dio;
  late final RequestOption baseHttpOption;

  INKApiClient(
    String baseUrl, {
    RequestOption? baseRequestOption,
    List<Interceptor>? interceptors, // 请求拦截，响应拦截，错误处理
  }) {
    RequestOption option = baseRequestOption ?? RequestOption.option();
    baseHttpOption = option;
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: option.connectTimeout,
      receiveTimeout: option.readTimeout,
      sendTimeout: option.writeTimeout,
      responseType: option.responseType,
      contentType: option.sendContentType,
    );
    dio = Dio(options);

    /// http适配器设置
    if (option.httpClientAdapter != null) {
      dio.httpClientAdapter = option.httpClientAdapter!;
    }

    /// 解码
    dio.transformer = BackgroundTransformer();

    dio.interceptors.addAll(interceptors ?? const []);
    if (!INKs.isReleaseMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  /// 客户端请求内部方法，一般不使用，
  /// 推荐使用上层方法封装的get/post/delete/put方法
  /// 有特殊请求需求时再使用
  Future<INKApiResult> internalRequest(
    String path, {
    String method = _HttpMethod.get,
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? overrideRequestOption,
    CancelToken? cancelToken,
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;
      options = (overrideRequestOption ?? OverrideRequestOption.noOption()).override(options);

      if (data != null) {
        data = jsonDecode(jsonEncode(data));
      }

      Response response = await dio.request(
        path,
        queryParameters: params,
        data: data,
        cancelToken: cancelToken,
        options: options,
      );

      return INKApiResult.data(response.data);
    } on DioException catch (ex, stackTrace) {
      INKs.log.warn(ex.toString());
      return INKApiResult.error(ex, stackTrace);
    } on Exception catch (ex, stackTrace) {
      INKs.log.warn(ex.toString());
      return INKApiResult.error(ex, stackTrace);
    }
  }

  Future<INKApiResult> get(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    OverrideRequestOption? option,
    CancelToken? cancelToken,
  }) async {
    return internalRequest(
      path,
      method: _HttpMethod.get,
      cancelToken: cancelToken,
      params: params,
      headers: headers,
      overrideRequestOption: option,
    );
  }

  Future<INKApiResult> post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? option,
    CancelToken? cancelToken,
  }) async {
    return internalRequest(
      path,
      method: _HttpMethod.post,
      cancelToken: cancelToken,
      params: params,
      data: data,
      headers: headers,
      overrideRequestOption: option,
    );
  }

  Future<INKApiResult> delete(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? option,
    CancelToken? cancelToken,
  }) async {
    return internalRequest(
      path,
      method: _HttpMethod.delete,
      cancelToken: cancelToken,
      params: params,
      data: data,
      headers: headers,
      overrideRequestOption: option,
    );
  }

  Future<INKApiResult> put(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? option,
    CancelToken? cancelToken,
  }) async {
    return internalRequest(
      path,
      method: _HttpMethod.put,
      cancelToken: cancelToken,
      params: params,
      data: data,
      headers: headers,
      overrideRequestOption: option,
    );
  }

  Future<INKApiResult> patch(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? option,
    CancelToken? cancelToken,
  }) async {
    return internalRequest(
      path,
      method: _HttpMethod.patch,
      cancelToken: cancelToken,
      params: params,
      data: data,
      headers: headers,
      overrideRequestOption: option,
    );
  }

  /// 下载
  Future download(
    String path,
    String localPath, {
    ProgressCallback? progressCallback,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) async {
    try {
      await dio.download(
        path,
        localPath,
        onReceiveProgress: progressCallback,
        queryParameters: params,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: options,
      );
    } on DioError {
      rethrow;
    }
  }
}
