import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// HTTP请求配置选项
class RequestOption {
  late int connectTimeout;
  late int readTimeout;
  late int writeTimeout;
  late String sendContentType;
  late ResponseType responseType;
  late HttpClientAdapter? httpClientAdapter;
  late JsonDecodeCallback jsonDecodeCallback;

  RequestOption();

  RequestOption.option() {
    connectTimeout = 5000;
    readTimeout = 30000;
    writeTimeout = 10000;
    sendContentType = Headers.jsonContentType;
    jsonDecodeCallback = _parseJson;
  }

  RequestOption copyWith({
    int? connectTimeout,
    int? readTimeout,
    int? writeTimeout,
    String? sendContentType,
    ResponseType? responseType,
    HttpClientAdapter? httpClientAdapter,
    JsonDecodeCallback? jsonDecodeCallback,
  }) {
    return (RequestOption()
      ..connectTimeout = connectTimeout ?? this.connectTimeout
      ..readTimeout = readTimeout ?? this.readTimeout
      ..writeTimeout = writeTimeout ?? this.writeTimeout
      ..sendContentType = sendContentType ?? this.sendContentType
      ..responseType = responseType ?? this.responseType
      ..httpClientAdapter = httpClientAdapter ?? this.httpClientAdapter
      ..jsonDecodeCallback = jsonDecodeCallback ?? this.jsonDecodeCallback);
  }
}

/// 必须为顶级函数
_parseJson(String text) {
  return compute(_parseAndDecode, text);
}

/// 必须为顶级函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}
