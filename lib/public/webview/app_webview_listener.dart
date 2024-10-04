import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// 监听WebView的滚动事件
typedef OnViewScrollChanged = void Function(
    InAppWebViewController webviewController, double scrollTop, double totalHeight);

/// 监听WebView加载完成事件
typedef OnWebviewLoaded = void Function(InAppWebViewController webviewController, String url);

/// 监听webView关闭事件
typedef OnWebviewClosed = void Function(String url);

/// 监听WebView中网页更换事件
typedef OnWebviewUrlChanged = void Function(String url);

/// WebView监听事件集合
final class AppWebviewListener {
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
