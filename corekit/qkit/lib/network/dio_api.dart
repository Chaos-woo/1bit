import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:qkit/qkit.dart';

import 'errors/error_handle.dart';

/// 对象数据转换器
typedef ObjectConvertor<R> = R Function(RawData raw_data);

final class HttpApiMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class IOApi {
  late final Dio _dio;
  late final RequestOption _base_http_option;
  late final List<DioErrorHandle> _io_error_handle;
  late final List<DioResponseErrorHandle> _io_response_error_handle;
  DioResponseErrorHandle? default_io_response_error_handle;

  IOApi(
    String base_url, {
    RequestOption? base_request_option,
    List<Interceptor>? interceptors,
    List<DioErrorHandle>? dio_error_handle,
    List<DioResponseErrorHandle>? dio_response_error_handle,
    this.default_io_response_error_handle,
  }) {
    RequestOption option = base_request_option ?? RequestOption.option();
    _base_http_option = option;
    BaseOptions options = BaseOptions(
      baseUrl: base_url,
      connectTimeout: option.connect_timeout,
      receiveTimeout: option.read_timeout,
      sendTimeout: option.write_timeout,
      responseType: option.response_type,
      contentType: option.send_content_type,
    );
    _dio = Dio(options);

    /// http适配器设置
    if (option.http_client_adapter != null) {
      _dio.httpClientAdapter = option.http_client_adapter!;
    }

    /// 解码
    _dio.transformer = DefaultTransformer()..jsonDecodeCallback = option.json_decoder;

    _dio.interceptors.addAll(interceptors ?? const []);
    if (!QKitUtils.is_release_mode) {
      _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    _io_error_handle =
        (null == dio_error_handle || dio_error_handle.isEmpty) ? [] : dio_error_handle;
    _io_response_error_handle =
        (null == dio_response_error_handle || dio_response_error_handle.isEmpty)
            ? []
            : dio_response_error_handle;
  }

  RequestOption get base_http_option => _base_http_option.copyWith();

  Future<T?> request<T>(
    String path, {
    String method = HttpApiMethod.get,
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? override_request_option,
    CancelToken? cancel_token,
    ObjectConvertor? object_convertor,
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;

      if (null != override_request_option) {
        if (null != override_request_option.write_timeout) {
          options.sendTimeout = override_request_option.write_timeout;
        }
        if (null != override_request_option.read_timeout) {
          options.receiveTimeout = override_request_option.read_timeout;
        }
        if (null != override_request_option.send_content_type) {
          options.contentType = override_request_option.send_content_type;
        }
        options.extra = override_request_option.extra;
      }

      if (data != null) {
        data = jsonDecode(jsonEncode(data));
      }

      Response response = await _dio.request(
        path,
        queryParameters: params,
        data: data,
        cancelToken: cancel_token,
        options: options,
      );

      return null != object_convertor
          ? object_convertor.call(RawData(response.data))
          : RawData(response.data);
    } catch (ex) {
      if (ex is DioError) {
        if ([
          DioErrorType.cancel,
          DioErrorType.connectTimeout,
          DioErrorType.sendTimeout,
          DioErrorType.receiveTimeout
        ].contains(ex.type)) {
          DioErrorHandle error_handle = _io_error_handle.firstWhere(
            (handle) => handle.match(ex.type),
            orElse: () => DefaultDioErrorHandle(),
          );
          error_handle.handle?.call(ex);
          return null;
        } else if (ex.type == DioErrorType.response) {
          if (null == ex.response) {
            ContinuePaasErrorSelection? pass_selection =
                (default_io_response_error_handle ?? DefaultDioResponseErrorHandle())
                    .handle
                    ?.call(ex.message);
            if ((pass_selection ?? ContinuePaasErrorSelection.no) ==
                ContinuePaasErrorSelection.yes) {
              rethrow;
            } else {
              return null;
            }
          }

          DioResponseErrorHandle error_handle = _io_response_error_handle.firstWhere(
            (handle) => handle.match(ex.response!.statusCode!),
            orElse: () => DefaultDioResponseErrorHandle(),
          );
          ContinuePaasErrorSelection? pass_selection = error_handle.handle?.call(ex.message);
          if ((pass_selection ?? ContinuePaasErrorSelection.no) == ContinuePaasErrorSelection.yes) {
            rethrow;
          } else {
            return null;
          }
        }
      }
      rethrow;
    }
  }

  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    OverrideRequestOption? request_option,
    CancelToken? cancel_token,
    ObjectConvertor? object_convertor,
  }) async {
    return request<T>(
      path,
      method: HttpApiMethod.get,
      cancel_token: cancel_token,
      params: params,
      headers: headers,
      object_convertor: object_convertor,
      override_request_option: request_option,
    );
  }

  Future<T?> post<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? request_option,
    CancelToken? cancel_token,
    ObjectConvertor? object_convertor,
  }) async {
    return request<T>(
      path,
      method: HttpApiMethod.post,
      cancel_token: cancel_token,
      params: params,
      data: data,
      headers: headers,
      object_convertor: object_convertor,
      override_request_option: request_option,
    );
  }

  Future<T?> delete<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? request_option,
    CancelToken? cancel_token,
    ObjectConvertor? object_convertor,
  }) async {
    return request<T>(path,
        method: HttpApiMethod.delete,
        cancel_token: cancel_token,
        params: params,
        data: data,
        headers: headers,
        object_convertor: object_convertor,
        override_request_option: request_option);
  }

  Future<T?> put<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? request_option,
    CancelToken? cancel_token,
    ObjectConvertor? object_convertor,
  }) async {
    return request<T>(path,
        method: HttpApiMethod.put,
        cancel_token: cancel_token,
        params: params,
        data: data,
        headers: headers,
        object_convertor: object_convertor,
        override_request_option: request_option);
  }

  Future<T?> patch<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? request_option,
    CancelToken? cancel_token,
    ObjectConvertor? object_convertor,
  }) async {
    return request<T>(
      path,
      method: HttpApiMethod.patch,
      cancel_token: cancel_token,
      params: params,
      data: data,
      headers: headers,
      object_convertor: object_convertor,
      override_request_option: request_option,
    );
  }

  /// 下载
  Future download(
    String path,
    String local_path, {
    ProgressCallback? progress_callback,
    Map<String, dynamic>? params,
    CancelToken? cancel_token,
    bool delete_on_error = true,
    String length_header = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) async {
    try {
      await _dio.download(
        path,
        local_path,
        onReceiveProgress: progress_callback,
        queryParameters: params,
        cancelToken: cancel_token,
        deleteOnError: delete_on_error,
        lengthHeader: length_header,
        data: data,
        options: options,
      );
    } on DioError {
      rethrow;
    }
  }

// Stream<T> getStream<T>(String path, CancelToken cancelToken,
//     {required bool Function(String data) validDataPredictor,
//     required bool Function(String data) donePredictor,
//     required String Function(String data) dataProcessor,
//     required T Function(Map<String, dynamic>) onSuccess}) {
//   final controller = StreamController<T>.broadcast();
//   _dio
//       .get(path, cancelToken: cancelToken, options: Options(responseType: ResponseType.stream))
//       .then((it) {
//     (it.data.stream as Stream).listen((it) {
//       final rawData = utf8.decode(it);
//
//       final dataList = rawData.split("\n").where((element) => element.isNotEmpty).toList();
//
//       for (final data in dataList) {
//         if (!validDataPredictor.call(data)) {
//           continue;
//         }
//         if (!donePredictor.call(data)) {
//           controller
//             ..sink
//             ..add(onSuccess(jsonDecode(dataProcessor.call(data))));
//         } else {
//           return;
//         }
//       }
//     }, onDone: () {
//       controller.close();
//     }, onError: (err, t) {
//       controller
//         ..sink
//         ..addError(err, t);
//     });
//   }, onError: (err, t) {
//     controller
//       ..sink
//       ..addError(err, t);
//   });
//
//   return controller.stream;
// }

// Stream<T> sse<T>(
//   String path,
//   CancelToken cancelToken,
//   Map<String, dynamic> request, {
//   required bool Function(String data) validDataPredictor,
//   required bool Function(String data) donePredictor,
//   required String Function(String data) dataProcessor,
//   required T Function(Map<String, dynamic> value) completeCallback,
// }) {
//   final controller = StreamController<T>.broadcast();
//
//   _dio
//       .post(path,
//           cancelToken: cancelToken,
//           data: json.encode(request),
//           options: Options(responseType: ResponseType.stream))
//       .then((iterator) {
//     iterator.data.stream.listen((it) {
//       final raw = utf8.decode(it);
//       final dataList = raw.split("\n").where((element) => element.isNotEmpty).toList();
//
//       for (final data in dataList) {
//         if (!validDataPredictor.call(data)) {
//           continue;
//         }
//
//         if (!donePredictor.call(data)) {
//           controller
//             ..sink
//             ..add(completeCallback(jsonDecode(dataProcessor.call(data))));
//         } else {
//           return;
//         }
//       }
//     }, onDone: () {
//       controller.close();
//     }, onError: (error, t) {
//       controller
//         ..sink
//         ..addError(error, t);
//     });
//   }, onError: (err, t) {
//     controller
//       ..sink
//       ..addError(err, t);
//   });
//   return controller.stream;
// }
}
