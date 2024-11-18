import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// =========== 通用监听事件1 ===========

/// 监听WebView的滚动事件
/// scrollTop: 当前滚动条顶部距离WebView顶部的距离
/// totalHeight: WebView的高度
typedef OnViewScrollChanged = Future<void> Function(
    InAppWebViewController webviewController, String url, double scrollTop, double totalHeight);

/// 监听WebView加载完成事件
typedef OnWebviewLoaded = Future<void> Function(InAppWebViewController webviewController, String url);

/// 监听webView关闭事件
typedef OnWebviewClosed = void Function(String url);

/// 监听WebView中网页更换事件
typedef OnWebviewUrlChanged = Future<void> Function(InAppWebViewController webviewController, String url);

/// 监听WebView的业务关闭事件，普通关闭按钮为通用关闭WebView事件
typedef OnWebviewBusinessClosed = void Function(String url);

/// WebView监听事件集合
class AppWebviewListener {
  final OnWebviewLoaded? onWebviewLoaded;
  final OnViewScrollChanged? onViewScrollChanged;
  final OnWebviewClosed? onWebviewClosed;
  final OnWebviewUrlChanged? onWebviewUrlChanged;

  const AppWebviewListener({
    this.onWebviewClosed,
    this.onWebviewUrlChanged,
    this.onWebviewLoaded,
    this.onViewScrollChanged,
  });
}

/// =========== 通用监听事件1 ===========

/// =========== 网页阅读监听事件1 ===========
/// 监听webView网页内容阅读完成事件
typedef OnWebviewUrlReadingCompleted = Future<void> Function(String url);

final class AppWebviewReadingListener extends AppWebviewListener {
  final OnWebviewUrlReadingCompleted? onWebviewUrlReadingCompleted;
  final OnWebviewBusinessClosed? onWebviewBusinessClosed;

  const AppWebviewReadingListener({
    super.onWebviewClosed,
    super.onWebviewUrlChanged,
    super.onWebviewLoaded,
    super.onViewScrollChanged,
    this.onWebviewUrlReadingCompleted,
    this.onWebviewBusinessClosed,
  });
}

/// =========== 网页阅读监听事件1 ===========
