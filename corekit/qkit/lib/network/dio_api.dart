import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:qkit/qkit.dart';

import 'errors/error_handle.dart';

typedef ObjectConvertor<R> = R Function(RawData rawData);

final class HttpApiMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class DioApi {
  late final Dio _dio;
  late final RequestOption _baseHttpOption;
  late final List<DioErrorHandle> _dioErrorHandle;
  late final List<DioResponseErrorHandle> _dioResponseErrorHandle;
  DioResponseErrorHandle? defaultDioResponseErrorHandle;

  DioApi(
    String baseUrl, {
    RequestOption? baseRequestOption,
    List<Interceptor>? interceptors,
    List<DioErrorHandle>? dioErrorHandle,
    List<DioResponseErrorHandle>? dioResponseErrorHandle,
    this.defaultDioResponseErrorHandle,
  }) {
    RequestOption option = baseRequestOption ?? RequestOption.option();
    _baseHttpOption = option;
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: option.connectTimeout,
      receiveTimeout: option.readTimeout,
      sendTimeout: option.writeTimeout,
      responseType: option.responseType,
      contentType: option.sendContentType,
    );
    _dio = Dio(options);

    /// http适配器设置
    if (option.httpClientAdapter != null) {
      _dio.httpClientAdapter = option.httpClientAdapter!;
    }

    /// 解码
    _dio.transformer = DefaultTransformer()..jsonDecodeCallback = option.jsonDecodeCallback;

    _dio.interceptors.addAll(interceptors ?? const []);
    if (!QKitUtils.isReleaseMode) {
      _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    _dioErrorHandle = (null == dioErrorHandle || dioErrorHandle.isEmpty) ? [] : dioErrorHandle;
    _dioResponseErrorHandle = (null == dioResponseErrorHandle || dioResponseErrorHandle.isEmpty)
        ? []
        : dioResponseErrorHandle;
  }

  RequestOption get baseHttpOption => _baseHttpOption.copyWith();

  Future<T?> request<T>(
    String path, {
    String method = HttpApiMethod.get,
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? requestOption,
    CancelToken? cancelToken,
    ObjectConvertor? objectConvertor,
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;

      if (null != requestOption) {
        if (null != requestOption.writeTimeout) {
          options.sendTimeout = requestOption.writeTimeout;
        }
        if (null != requestOption.readTimeout) {
          options.receiveTimeout = requestOption.readTimeout;
        }
        if (null != requestOption.sendContentType) {
          options.contentType = requestOption.sendContentType;
        }
        options.extra = requestOption.extra;
      }

      if (data != null) {
        data = jsonDecode(jsonEncode(data));
      }

      Response response = await _dio.request(
        path,
        queryParameters: params,
        data: data,
        cancelToken: cancelToken,
        options: options,
      );

      return null != objectConvertor
          ? objectConvertor.call(RawData(response.data))
          : RawData(response.data);
    } catch (ex) {
      if (ex is DioError) {
        if ([
          DioErrorType.cancel,
          DioErrorType.connectTimeout,
          DioErrorType.sendTimeout,
          DioErrorType.receiveTimeout
        ].contains(ex.type)) {
          DioErrorHandle errorHandle = _dioErrorHandle.firstWhere(
            (handle) => handle.match(ex.type),
            orElse: () => DefaultDioErrorHandle(),
          );
          errorHandle.handle?.call(ex);
          return null;
        } else if (ex.type == DioErrorType.response) {
          if (null == ex.response) {
            (defaultDioResponseErrorHandle ?? DefaultDioResponseErrorHandle())
                .handle
                ?.call(ex.message);
            return null;
          }

          DioResponseErrorHandle errorHandle = _dioResponseErrorHandle.firstWhere(
            (handle) => handle.match(ex.response!.statusCode!),
            orElse: () => DefaultDioResponseErrorHandle(),
          );
          errorHandle.handle?.call(ex.message);
          return null;
        }
      }
      rethrow;
    }
  }

  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    OverrideRequestOption? requestOption,
    CancelToken? cancelToken,
    ObjectConvertor? objectConvertor,
  }) async {
    return request<T>(
      path,
      method: HttpApiMethod.get,
      cancelToken: cancelToken,
      params: params,
      headers: headers,
      objectConvertor: objectConvertor,
      requestOption: requestOption,
    );
  }

  Future<T?> post<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? requestOption,
    CancelToken? cancelToken,
    ObjectConvertor? objectConvertor,
  }) async {
    return request<T>(
      path,
      method: HttpApiMethod.post,
      cancelToken: cancelToken,
      params: params,
      data: data,
      headers: headers,
      objectConvertor: objectConvertor,
      requestOption: requestOption,
    );
  }

  Future<T?> delete<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? requestOption,
    CancelToken? cancelToken,
    ObjectConvertor? objectConvertor,
  }) async {
    return request<T>(path,
        method: HttpApiMethod.delete,
        cancelToken: cancelToken,
        params: params,
        data: data,
        headers: headers,
        objectConvertor: objectConvertor,
        requestOption: requestOption);
  }

  Future<T?> put<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? requestOption,
    CancelToken? cancelToken,
    ObjectConvertor? objectConvertor,
  }) async {
    return request<T>(path,
        method: HttpApiMethod.put,
        cancelToken: cancelToken,
        params: params,
        data: data,
        headers: headers,
        objectConvertor: objectConvertor,
        requestOption: requestOption);
  }

  Future<T?> patch<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Map<String, dynamic>? headers,
    OverrideRequestOption? requestOption,
    CancelToken? cancelToken,
    ObjectConvertor? objectConvertor,
  }) async {
    return request<T>(
      path,
      method: HttpApiMethod.patch,
      cancelToken: cancelToken,
      params: params,
      data: data,
      headers: headers,
      objectConvertor: objectConvertor,
      requestOption: requestOption,
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
      await _dio.download(
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
