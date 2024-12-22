import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/webview/app_webview_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';
import 'package:url_launcher/url_launcher.dart';

/// 通过Dialog的方式浏览网页，仅有简单的网页浏览功能，没有导航栏搜索
Future<void> show_webview_dialog({
  required String url,
  String? title,
  BuildContext? context,
  AppWebviewListener? listener,

  /// 不需要webview导航的scheme
  List<String>? not_navigation_action_scheme,

  /// 不需要webview导航的URL关键词
  List<String>? not_navigation_action_keywords,
}) async {
  var b_context = context ?? Get.context!;
  await showDialog(
    barrierColor: Color(0x80000000),
    context: b_context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment: AlignmentDirectional(0, 0).resolve(Directionality.of(b_context)),
        child: Container(
          child: AppWebviewDialog(
            url,
            title: title,
            not_navigation_action_scheme: not_navigation_action_scheme,
            not_navigation_action_keywords: not_navigation_action_keywords,
            listener: listener,
          ),
        ),
      );
    },
  );
}

class AppWebviewDialog extends StatefulWidget {
  final String url;
  final String? title;

  /// 不需要webview导航的scheme
  final List<String>? not_navigation_action_scheme;

  /// 不需要webview导航的URL关键词
  final List<String>? not_navigation_action_keywords;

  /// 监听WebView的滚动事件
  final AppWebviewListener? listener;

  AppWebviewDialog(
    this.url, {
    super.key,
    this.title,
    this.not_navigation_action_scheme,
    this.not_navigation_action_keywords,
    this.listener,
  });

  @override
  State<AppWebviewDialog> createState() => _AppWebviewDialogState();
}

class _AppWebviewDialogState extends State<AppWebviewDialog> {
  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: QKitUtils.is_release_mode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllow: "camera; microphone",
    iframeAllowFullscreen: true,
    javaScriptEnabled: true,
    applicationNameForUserAgent:
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763',
  );

  PullToRefreshController? pull_to_refresh_controller;
  double progress = 0;
  final GlobalKey glob_webview_key = GlobalKey();

  late String url;

  @override
  void initState() {
    super.initState();
    this.url = widget.url;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pull_to_refresh_controller = PullToRefreshController(
        settings: PullToRefreshSettings(
          color: FlutterFlowTheme.of(context).primary,
        ),
        onRefresh: () async {
          // 仅使用了Android的加载
          webViewController?.reload();
          // if (defaultTargetPlatform == TargetPlatform.android) {
          //   webViewController?.reload();
          // } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          //   webViewController?.loadUrl(
          //       urlRequest:
          //       URLRequest(url: await webViewController?.getUrl()));
          // }
        },
      );
    });
  }

  @override
  void dispose() {
    pull_to_refresh_controller?.dispose();
    webViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x9AFFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Color(0x1E000000),
                    offset: Offset(
                      0,
                      5,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Container(
                      width: double.infinity,
                      height: q0_.bridge.flustars.screen.screenHeightExt * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: widget.title != null
                            ? AppBar(
                                title: AutoSizeText(
                                  '${widget.title!}',
                                  maxLines: 2,
                                  minFontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                        letterSpacing: 0,
                                      ),
                                ),
                                automaticallyImplyLeading: false,
                                centerTitle: false,
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.transparent,
                              )
                            : null,
                        body: SafeArea(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Stack(
                                  children: [
                                    InAppWebView(
                                      key: glob_webview_key,
                                      initialUrlRequest: URLRequest(url: WebUri(this.url)),
                                      initialSettings: settings,
                                      pullToRefreshController: pull_to_refresh_controller,
                                      onWebViewCreated: (controller) {
                                        print('Webview created');
                                        webViewController = controller;
                                      },
                                      onLoadStart: (controller, url) {
                                        print('loading started loading: $url');
                                        setState(() {
                                          this.url = url.toString();
                                        });
                                      },
                                      onPermissionRequest: (controller, request) async {
                                        return PermissionResponse(
                                            resources: request.resources, action: PermissionResponseAction.GRANT);
                                      },
                                      shouldOverrideUrlLoading: (controller, navigationAction) async {
                                        var uri = navigationAction.request.url!;

                                        var normal_scheme = const [
                                          "http",
                                          "https",
                                          "file",
                                          "chrome",
                                          "data",
                                          "javascript",
                                          "about",
                                        ];
                                        if (!normal_scheme.contains(uri.scheme)) {
                                          // 判断非通用的scheme，是否可以打开，支持自定义判断
                                          var key_schemes = widget.not_navigation_action_scheme ?? <String>[];
                                          for (var key_scheme in key_schemes) {
                                            if (uri.scheme.contains(key_scheme)) {
                                              return NavigationActionPolicy.CANCEL;
                                            }
                                          }

                                          if (await canLaunchUrl(uri)) {
                                            // 支持打开外部应用
                                            await launchUrl(
                                              uri,
                                            );
                                            // 同时取消当前web页面的打开
                                            return NavigationActionPolicy.CANCEL;
                                          }
                                        }

                                        // 判断目标URL是否可以打开，使用自定义的关键词匹配，可以阻止某些网页自动跳转
                                        var url_keywords = widget.not_navigation_action_keywords ?? <String>[];
                                        for (var keyword in url_keywords) {
                                          if (uri.path!.contains(keyword)) {
                                            print('Target URL hit keyword: ${keyword}');
                                            return NavigationActionPolicy.CANCEL;
                                          }
                                        }

                                        // 默认情况下是允许跳转的
                                        return NavigationActionPolicy.ALLOW;
                                      },
                                      onLoadStop: (controller, url) async {
                                        print('loading stopped loading: $url');
                                        pull_to_refresh_controller?.endRefreshing();
                                        setState(() {
                                          this.url = url.toString();
                                        });

                                        if (widget.url != url.toString()) {
                                          await widget.listener?.onWebviewUrlChanged
                                              ?.call(webViewController!, url.toString());
                                        }

                                        await widget.listener?.onWebviewLoaded
                                            ?.call(webViewController!, url.toString());

                                        // controller.evaluateJavascript(
                                        //     source: "document.documentElement.scrollTo(0, 5000)");
                                        // QKit.ui.toast.show('跳转到上次阅读位置');
                                        // await widget.listener?.onWebviewLoaded?.call(controller, url.toString());
                                      },
                                      onReceivedError: (controller, request, error) {
                                        print('received error occurred');
                                        pull_to_refresh_controller?.endRefreshing();
                                      },
                                      onProgressChanged: (controller, progress) {
                                        print('loading progress: $progress');
                                        if (progress == 100) {
                                          pull_to_refresh_controller?.endRefreshing();
                                        }
                                        setState(() {
                                          this.progress = progress / 100;
                                        });
                                      },
                                      onUpdateVisitedHistory: (controller, url, androidIsReload) {
                                        print('update visited history: $url');
                                        setState(() {
                                          this.url = url.toString();
                                        });
                                      },
                                      onConsoleMessage: (controller, consoleMessage) {
                                        if (!context.is_release_mode) {
                                          print(consoleMessage);
                                        }
                                      },
                                      onScrollChanged: (controller, x, y) async {
                                        var get_total_height_command = "document.body.scrollHeight";
                                        var get_scroll_top_height_command =
                                            "document.documentElement.scrollTop || document.body.scrollTop";
                                        controller
                                            .evaluateJavascript(source: get_total_height_command)
                                            .then((totalHeight) {
                                          controller
                                              .evaluateJavascript(source: get_scroll_top_height_command)
                                              .then((clientHeight) async {
                                            if (totalHeight != null && clientHeight != null) {
                                              double totalHeightDouble = totalHeight.toDouble();
                                              double scrollTopDouble = clientHeight.toDouble();
                                              print('onScrollChanged: $scrollTopDouble, $totalHeightDouble');
                                              await widget.listener?.onViewScrollChanged
                                                  ?.call(controller, this.url, scrollTopDouble, totalHeightDouble);
                                            }
                                          });
                                        });
                                      },
                                    ),
                                    progress < 1.0
                                        ? LinearProgressIndicator(
                                            value: progress,
                                            color: FlutterFlowTheme.of(context).primary,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 5, 12, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Color(0xFFE5E7EB),
                              borderRadius: 8,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: Colors.white,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {
                                // webview后退
                                webViewController?.goBack();
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Color(0xFFE5E7EB),
                              borderRadius: 8,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: Colors.white,
                              icon: Icon(
                                Icons.arrow_forward_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {
                                // webview前进
                                webViewController?.goForward();
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Color(0xFFE5E7EB),
                              borderRadius: 8,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: Colors.white,
                              icon: Icon(
                                Icons.refresh_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () {
                                // webview刷新
                                webViewController?.reload();
                              },
                            ),
                            if (widget.listener is AppWebviewReadingListener)
                              FlutterFlowIconButton(
                                borderColor: Color(0xFFE5E7EB),
                                borderRadius: 8,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: Colors.white,
                                icon: Icon(
                                  Icons.event_available_rounded,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                onPressed: () {
                                  if (widget.listener != null) {
                                    (widget.listener as AppWebviewReadingListener)
                                        .onWebviewUrlReadingCompleted
                                        ?.call(url);
                                  }
                                },
                              ),
                            if (widget.listener is AppWebviewReadingListener)
                              FlutterFlowIconButton(
                                borderColor: Color(0xFFE5E7EB),
                                borderRadius: 8,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: Colors.white,
                                icon: Icon(
                                  Icons.closed_caption_disabled_outlined,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                onPressed: () {
                                  if (widget.listener != null) {
                                    (widget.listener as AppWebviewReadingListener).onWebviewBusinessClosed?.call(url);
                                  }
                                },
                              ),
                          ].divide(SizedBox(width: 10)),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Color(0xFFE5E7EB),
                          borderRadius: 8,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                          onPressed: () {
                            q0_.delay.delay(() {
                              widget.listener?.onWebviewClosed?.call(url);
                            });
                            // 关闭dialog
                            q0_.route.back();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
