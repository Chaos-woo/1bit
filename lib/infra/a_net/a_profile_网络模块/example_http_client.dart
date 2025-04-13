import 'dart:convert';

import 'package:cw2bit/infra/a_net/api_client.dart';
import 'package:cw2bit/infra/a_net/http_request_option.dart';
import 'package:cw2bit/infra/a_net/value/api_value.dart';
import 'package:dio/dio.dart';

class ExampleApi {
  late final INKApiClient client;

  ExampleApi() {
    client = INKApiClient(
      'https://example.com',
      baseRequestOption: RequestOption.option(),
      interceptors: [
        DioStatusInterceptor(),
        HttpStatusInterceptor(),
        ExampleInterceptor(),
      ],
    );
  }

  /// ...
  /// 自定义接口请求
}

class ExampleInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// 增加签名请求头
    options.headers['x-example-sign'] = 'xxx';

    /// ...

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /// 解析响应内容
    /// 将 {"code":1, "data": {}, "msg": "ok"} 中的data字段抽取出来
    final responseData = switch (response.data) {
      Map<String, dynamic> data => data,
      String jsonString => jsonDecode(jsonString) as Map<String, dynamic>,
      _ => throw DioException(
          response: (response
            ..extra[kLocalApiErrorType] = vLocalBizApiError
            ..extra[kLocalApiErrorTypeCode] = localApiErrorCode),
          requestOptions: response.requestOptions,
          error: '响应数据格式无法解析',
          type: DioExceptionType.badResponse,
        ),
    };

    try {
      if (!responseData.containsKey('code') || !responseData.containsKey('data') || !responseData.containsKey('msg')) {
        // 假设返回的json格式为 {"code":1, "data": {}, "msg": "ok"}
        throw DioException(
          response: (response
            ..extra[kLocalApiErrorType] = vLocalBizApiError
            ..extra[kLocalApiErrorTypeCode] = localApiErrorCode),
          requestOptions: response.requestOptions,
          error: '响应数据格式无法解析',
          type: DioExceptionType.badResponse,
        );
      }

      if (responseData['code'] != 1) {
        // 判断1种业务错误码的方式
        throw DioException(
          response: (response
            ..extra[kLocalApiErrorType] = vLocalBizApiError
            ..extra[kLocalApiErrorTypeCode] = responseData['code']),
          requestOptions: response.requestOptions,
          error: responseData['msg'] ?? '没有更多的错误信息',
          type: DioExceptionType.badResponse,
        );
      } else {
        response.data = responseData;
        handler.next(response);
      }
    } on DioException catch (ex) {
      // 捕获到业务错误的异常后，结束当前请求，不再继续向后处理
      handler.reject(ex);
    } on Exception catch (ex) {
      // 捕获到其他位置的异常后，结束当前请求，不再继续向后处理
      handler.reject(DioException(
        response: (response
          ..extra[kLocalApiErrorType] = vLocalBizApiError
          ..extra[kLocalApiErrorTypeCode] = localApiErrorCode),
        requestOptions: response.requestOptions,
        error: ex,
        type: DioExceptionType.unknown,
      ));
    }
  }
}

class HttpStatusInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    DioException createStatusError(DioException err, String message) {
      return DioException(
        response: err.response?..extra[kLocalApiErrorType] = vLocalHttpApiError,
        requestOptions: err.requestOptions,
        error: message,
        type: DioExceptionType.badResponse,
      );
    }

    DioException newErr = switch (err.response?.statusCode) {
      400 => createStatusError(err, '请求参数错误'),
      401 => createStatusError(err, '未授权'),
      403 => createStatusError(err, '禁止访问'),
      404 => createStatusError(err, '资源不存在'),
      408 => createStatusError(err, '请求超时'),
      500 => createStatusError(err, '服务器内部错误'),
      502 => createStatusError(err, '网关错误'),
      503 => createStatusError(err, '服务不可用'),
      504 => createStatusError(err, '网关超时'),
      _ => createStatusError(err, '未知错误'),
    };

    // 优先判断HTTP状态错误码，结束该请求
    handler.reject(newErr);
  }
}

class DioStatusInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    DioException createStatusError(DioException err, String message) {
      return DioException(
        response: err.response?..extra[kLocalApiErrorType] = vLocalDioApiError,
        requestOptions: err.requestOptions,
        error: message,
        type: err.type,
      );
    }

    DioException? newErr = switch (err.type) {
      DioExceptionType.connectionTimeout => createStatusError(err, '连接超时'),
      DioExceptionType.sendTimeout => createStatusError(err, '请求超时'),
      DioExceptionType.receiveTimeout => createStatusError(err, '响应超时'),
      DioExceptionType.badCertificate => createStatusError(err, '证书错误'),
      DioExceptionType.cancel => createStatusError(err, '请求取消'),
      DioExceptionType.connectionError => createStatusError(err, '连接错误'),
      DioExceptionType.unknown => createStatusError(err, '未知错误'),
      _ => null,
    };

    if (newErr != null) {
      // 优先判断DIO错误类型，结束该请求
      handler.reject(newErr);
    } else {
      handler.next(err);
    }
  }
}
