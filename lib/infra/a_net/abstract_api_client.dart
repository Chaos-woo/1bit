import 'dart:async';
import 'dart:convert';

import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_net/Raw.dart';
import 'package:cw2bit/infra/a_net/http_request_option.dart';
import 'package:dio/dio.dart';

final class _HttpMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

abstract class INKApiClient {
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
    dio.transformer = DefaultTransformer()..jsonDecodeCallback = option.jsonDecoder;

    dio.interceptors.addAll(interceptors ?? const []);
    if (!INKs.isReleaseMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  Future<Raw> internalRequest(
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

      return Raw.data(response.data);
    } catch (ex) {
      INKs.log.warn(ex.toString());
      rethrow;
    }
  }

  Future<Raw> get(
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

  Future<Raw> post(
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

  Future<Raw> delete(
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

  Future<Raw> put(
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

  Future<Raw> patch(
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
