import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:qkit/qkit.dart';

typedef ResponseTransformer<R> = R Function(RawData rawData);

class DioClientKit {
  late final Dio _dio;
  late final RequestOption _httpOption;

  DioClientKit(
    String baseUrl, {
    RequestOption? requestOption,
    List<Interceptor>? interceptors,
  }) {
    RequestOption option = requestOption ?? RequestOption.option();
    _httpOption = option;
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
    _dio.transformer = DefaultTransformer()
      ..jsonDecodeCallback = option.jsonDecodeCallback;

    _dio.interceptors.addAll(interceptors ?? const []);
  }

  RequestOption get httpOption => _httpOption.copyWith();

  Future<T> request<T>(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? parameters,
    dynamic data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ResponseTransformer? responseTransformer,
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;

      if (data != null) {
        data = jsonDecode(jsonEncode(data));
      }

      Response response = await _dio.request(
        path,
        queryParameters: parameters,
        data: data,
        cancelToken: cancelToken,
        options: options,
      );

      return null != responseTransformer
          ? responseTransformer.call(RawData(response.data))
          : RawData(response.data);
    } catch (ex) {
      throw ApiError.create(ex);
    }
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ResponseTransformer? responseTransformer,
  }) {
    return request<T>(
      path,
      method: 'GET',
      cancelToken: cancelToken,
      parameters: parameters,
      headers: headers,
      responseTransformer: responseTransformer,
    );
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? parameters,
    data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ResponseTransformer? responseTransformer,
  }) {
    return request<T>(
      path,
      method: 'POST',
      cancelToken: cancelToken,
      parameters: parameters,
      data: data,
      headers: headers,
      responseTransformer: responseTransformer,
    );
  }

  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? parameters,
    data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ResponseTransformer? responseTransformer,
  }) {
    return request<T>(
      path,
      method: 'DELETE',
      cancelToken: cancelToken,
      parameters: parameters,
      data: data,
      headers: headers,
      responseTransformer: responseTransformer,
    );
  }

  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? parameters,
    data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ResponseTransformer? responseTransformer,
  }) {
    return request<T>(
      path,
      method: 'PUT',
      cancelToken: cancelToken,
      parameters: parameters,
      data: data,
      headers: headers,
      responseTransformer: responseTransformer,
    );
  }

  Future<T> patch<T>(
    String path, {
    Map<String, dynamic>? parameters,
    data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    ResponseTransformer? responseTransformer,
  }) {
    return request<T>(
      path,
      method: 'PATCH',
      cancelToken: cancelToken,
      parameters: parameters,
      data: data,
      headers: headers,
      responseTransformer: responseTransformer,
    );
  }

  /// 下载
  Future download(
    String path,
    String localPath, {
    ProgressCallback? progressCallback,
    Map<String, dynamic>? parameters,
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
        queryParameters: parameters,
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

  Stream<T> getStream<T>(String path, CancelToken cancelToken,
      {required bool Function(String data) validDataPredictor,
      required bool Function(String data) donePredictor,
      required String Function(String data) dataProcessor,
      required T Function(Map<String, dynamic>) onSuccess}) {
    final controller = StreamController<T>.broadcast();
    _dio
        .get(path,
            cancelToken: cancelToken,
            options: Options(responseType: ResponseType.stream))
        .then((it) {
      (it.data.stream as Stream).listen((it) {
        final rawData = utf8.decode(it);

        final dataList =
            rawData.split("\n").where((element) => element.isNotEmpty).toList();

        for (final data in dataList) {
          if (!validDataPredictor.call(data)) {
            continue;
          }
          if (!donePredictor.call(data)) {
            controller
              ..sink
              ..add(onSuccess(jsonDecode(dataProcessor.call(data))));
          } else {
            return;
          }
        }
      }, onDone: () {
        controller.close();
      }, onError: (err, t) {
        controller
          ..sink
          ..addError(err, t);
      });
    }, onError: (err, t) {
      controller
        ..sink
        ..addError(err, t);
    });

    return controller.stream;
  }

  Stream<T> sse<T>(
    String path,
    CancelToken cancelToken,
    Map<String, dynamic> request, {
    required bool Function(String data) validDataPredictor,
    required bool Function(String data) donePredictor,
    required String Function(String data) dataProcessor,
    required T Function(Map<String, dynamic> value) completeCallback,
  }) {
    final controller = StreamController<T>.broadcast();

    _dio
        .post(path,
            cancelToken: cancelToken,
            data: json.encode(request),
            options: Options(responseType: ResponseType.stream))
        .then((iterator) {
      iterator.data.stream.listen((it) {
        final raw = utf8.decode(it);
        final dataList =
            raw.split("\n").where((element) => element.isNotEmpty).toList();

        for (final data in dataList) {
          if (!validDataPredictor.call(data)) {
            continue;
          }

          if (!donePredictor.call(data)) {
            controller
              ..sink
              ..add(completeCallback(jsonDecode(dataProcessor.call(data))));
          } else {
            return;
          }
        }
      }, onDone: () {
        controller.close();
      }, onError: (error, t) {
        controller
          ..sink
          ..addError(error, t);
      });
    }, onError: (err, t) {
      controller
        ..sink
        ..addError(err, t);
    });
    return controller.stream;
  }
}
