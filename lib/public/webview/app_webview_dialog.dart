import 'package:auto_size_text/auto_size_text.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
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
          ),
        ),
      );
    },
  );
}

class AppWebviewDialog extends StatefulWidget {
  final String url;
  final String? title;

  AppWebviewDialog(this.url, {super.key, this.title});

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
      iframeAllowFullscreen: true);

  PullToRefreshController? pullToRefreshController;
  double progress = 0;
  final urlController = TextEditingController();
  final GlobalKey webViewKey = GlobalKey();

  late String url;

  @override
  void initState() {
    super.initState();
    this.url = widget.url;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pullToRefreshController = PullToRefreshController(
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
                      height: QKit.bridge.flustars.screen.screenHeightExt * 0.85,
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
                                        fontFamily: 'Readex Pro',
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
                                      key: webViewKey,
                                      initialUrlRequest: URLRequest(url: WebUri(this.url)),
                                      initialSettings: settings,
                                      pullToRefreshController: pullToRefreshController,
                                      onWebViewCreated: (controller) {
                                        webViewController = controller;
                                      },
                                      onLoadStart: (controller, url) {
                                        setState(() {
                                          this.url = url.toString();
                                          urlController.text = this.url;
                                        });
                                      },
                                      onPermissionRequest: (controller, request) async {
                                        return PermissionResponse(
                                            resources: request.resources,
                                            action: PermissionResponseAction.GRANT);
                                      },
                                      shouldOverrideUrlLoading:
                                          (controller, navigationAction) async {
                                        var uri = navigationAction.request.url!;

                                        if (![
                                          "http",
                                          "https",
                                          "file",
                                          "chrome",
                                          "data",
                                          "javascript",
                                          "about"
                                        ].contains(uri.scheme)) {
                                          if (await canLaunchUrl(uri)) {
                                            // Launch the App
                                            await launchUrl(
                                              uri,
                                            );
                                            // and cancel the request
                                            return NavigationActionPolicy.CANCEL;
                                          }
                                        }

                                        return NavigationActionPolicy.ALLOW;
                                      },
                                      onLoadStop: (controller, url) async {
                                        pullToRefreshController?.endRefreshing();
                                        setState(() {
                                          this.url = url.toString();
                                          urlController.text = this.url;
                                        });
                                      },
                                      onReceivedError: (controller, request, error) {
                                        pullToRefreshController?.endRefreshing();
                                      },
                                      onProgressChanged: (controller, progress) {
                                        if (progress == 100) {
                                          pullToRefreshController?.endRefreshing();
                                        }
                                        setState(() {
                                          this.progress = progress / 100;
                                          urlController.text = url;
                                        });
                                      },
                                      onUpdateVisitedHistory: (controller, url, androidIsReload) {
                                        setState(() {
                                          this.url = url.toString();
                                          urlController.text = this.url;
                                        });
                                      },
                                      onConsoleMessage: (controller, consoleMessage) {
                                        if (!QKitUtils.is_release_mode) {
                                          print(consoleMessage);
                                        }
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
                  // Generated code for this Row Widget...
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
                            // 关闭dialog
                            QKit.route.back();
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
