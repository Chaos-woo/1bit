import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:qkit/qkit.dart';

void main() {
  DefaultAppInitializer.run(
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
  QKit.logger.error(details);
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
            themeMode: ThemeMode.system,
            // locale: AppTranslation.locale,
            // fallbackLocale: AppTranslation.fallbackLocale,
            // translations: AppTranslation(),
            initialRoute: AppRoutes.kHome,
            getPages: QDispatcher.pageRoutes,
            debugShowCheckedModeBanner: !QUtils.isReleaseMode,
            enableLog: !QUtils.isReleaseMode,
            builder: EasyLoading.init())
        .smartRefreshConfiguration(
          headerBuilder: () => const ClassicHeader(),
          footerBuilder: () => const ClassicFooter(),
        )
        .okToast();
  }
}
