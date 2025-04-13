import 'dart:convert';

import 'package:cw2bit/infra/a_extension/int_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// HTTP请求配置选项
class RequestOption {
  late Duration connectTimeout;
  late Duration readTimeout;
  late Duration writeTimeout;
  late String sendContentType;
  late ResponseType responseType;
  late HttpClientAdapter? httpClientAdapter;
  late JsonDecodeCallback jsonDecoder;

  RequestOption();

  RequestOption.option() {
    connectTimeout = 5.seconds;
    readTimeout = 30.seconds;
    writeTimeout = 10.seconds;
    sendContentType = Headers.jsonContentType;
    responseType = ResponseType.json;
    httpClientAdapter = null;
    jsonDecoder = _parseJson;
  }

  RequestOption copyWith({
    Duration? connectTimeout,
    Duration? readTimeout,
    Duration? writeTimeout,
    String? sendContentType,
    ResponseType? responseType,
    HttpClientAdapter? httpClientAdapter,
    JsonDecodeCallback? jsonDecoder,
  }) {
    return (RequestOption()
      ..connectTimeout = connectTimeout ?? this.connectTimeout
      ..readTimeout = readTimeout ?? this.readTimeout
      ..writeTimeout = writeTimeout ?? this.writeTimeout
      ..sendContentType = sendContentType ?? this.sendContentType
      ..responseType = responseType ?? this.responseType
      ..httpClientAdapter = httpClientAdapter ?? this.httpClientAdapter
      ..jsonDecoder = jsonDecoder ?? this.jsonDecoder);
  }
}

final class OverrideRequestOption {
  Duration? readTimeout;
  Duration? writeTimeout;
  String? sendContentType;
  Map<String, dynamic>? extra;

  OverrideRequestOption({
    this.readTimeout,
    this.writeTimeout,
    this.sendContentType,
    this.extra,
  });

  OverrideRequestOption.noOption();

  Options override(Options options) {
    if (null != writeTimeout) {
      options.sendTimeout = writeTimeout;
    }
    if (null != readTimeout) {
      options.receiveTimeout = readTimeout;
    }
    if (null != sendContentType) {
      options.contentType = sendContentType;
    }
    options.extra = extra;
    return options;
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
