import 'dart:io';

import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_sdk_bridge/text_util_extension.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// HTTP客户端适配器配置，代理
final class HttpClientProxyFactory {
  static HttpClientAdapter create({String host = '', int port = 0}) {
    return IOHttpClientAdapter(
      createHttpClient: () {
        var client = HttpClient();
        if (INKs.sdk.text.isNotEmpty(host, strip: true)) {
          client.findProxy = (url) => 'PROXY $host:$port';
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        } else {
          return client;
        }
      },
    );
  }
}
