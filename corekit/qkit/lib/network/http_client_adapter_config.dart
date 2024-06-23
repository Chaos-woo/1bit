import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:qkit/qkit.dart';

/// HTTP客户端适配器配置，代理
class HttpClientAdapterBuilder {
  static HttpClientAdapter build({String? proxy}) {
    return DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        if (!(QKit.bridge.flustars.text.isEmpty(proxy))) {
          client.findProxy = (url) => 'PROXY $proxy';
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        } else {
          return client;
        }
      };
  }
}
