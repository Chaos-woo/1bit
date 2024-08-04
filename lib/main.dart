import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:qkit/qkit.dart';

void main() {
  AppStarter.run(
    const MyApp(),
    preprocessed: () {
      /// 初始化路由
      AppPageRouter.initRoutePage();
    },
    initCompleted: () {
      /// 初始化业务数据
      Apis.initApis();
    },
    afterRunAppProcessed: () {
      /// 配置easyloading配置
    },
    errorReporter: _errorReporter,
  );
}

void _errorReporter(FlutterErrorDetails details) {
  FlutterError.dumpErrorToConsole(details);
  QKit.log.error(details);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// MaterialApp组件中，home、initialRoute和routes的区别：
  /// https://blog.csdn.net/shiyangkai/article/details/124275204

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
            title: '1bit',
            scrollBehavior: const CupertinoScrollBehavior(),
            themeMode: ThemeMode.light,
            initialRoute: rt_home,
            getPages: RouteProxyDispatcher.s_pageRoutes,
            debugShowCheckedModeBanner: !QKitUtils.is_release_mode,
            enableLog: !QKitUtils.is_release_mode,
            builder: EasyLoading.init())
        .smartRefreshConfiguration(
          hideFooterWhenNotFull: false,
          enableLoadingWhenNoData: true,
          headerBuilder: () => const ClassicHeader(
            releaseText: '释放开始刷新...',
            refreshingText: '刷新中...',
            completeText: '刷新完成...',
            failedText: '刷新失败...',
            idleText: '继续深潜...',
          ),
          footerBuilder: () => ClassicFooter(
            loadingText: '加载中...',
            noDataText: '已经没有更多啦...',
            idleText: '',
            idleIcon: null,
            failedText: '加载失败...',
            canLoadingText: '释放开始加载...',
          ),
        )
        .okToast();
  }
}
