import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// HTTP请求配置选项
class RequestOption {
  late int connect_timeout;
  late int read_timeout;
  late int write_timeout;
  late String send_content_type;
  late ResponseType response_type;
  late HttpClientAdapter? http_client_adapter;
  late JsonDecodeCallback json_decoder;

  RequestOption();

  RequestOption.option() {
    connect_timeout = 5000;
    read_timeout = 30000;
    write_timeout = 10000;
    send_content_type = Headers.jsonContentType;
    response_type = ResponseType.json;
    http_client_adapter = null;
    json_decoder = _parse_json;
  }

  RequestOption copyWith({
    int? connect_timeout,
    int? read_timeout,
    int? write_timeout,
    String? send_content_type,
    ResponseType? response_type,
    HttpClientAdapter? http_client_adapter,
    JsonDecodeCallback? json_decoder,
  }) {
    return (RequestOption()
      ..connect_timeout = connect_timeout ?? this.connect_timeout
      ..read_timeout = read_timeout ?? this.read_timeout
      ..write_timeout = write_timeout ?? this.write_timeout
      ..send_content_type = send_content_type ?? this.send_content_type
      ..response_type = response_type ?? this.response_type
      ..http_client_adapter = http_client_adapter ?? this.http_client_adapter
      ..json_decoder = json_decoder ?? this.json_decoder);
  }
}

class OverrideRequestOption {
  int? read_timeout;
  int? write_timeout;
  String? send_content_type;
  Map<String, dynamic>? extra;

  OverrideRequestOption({
    this.read_timeout,
    this.write_timeout,
    this.send_content_type,
    this.extra,
  });
}

/// 必须为顶级函数
_parse_json(String text) {
  return compute(_parse_and_decode, text);
}

/// 必须为顶级函数
_parse_and_decode(String response) {
  return jsonDecode(response);
}
