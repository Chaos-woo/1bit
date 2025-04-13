import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_app_setup/default_app_starter.dart';
import 'package:cw2bit/infra/a_ui/ok_toast_extension.dart';
import 'package:cw2bit/infra/a_ui/smart_refresher_extension.dart';
import 'package:cw2bit/infra/a_ui/toast.dart';
import 'package:cw2bit/modules/b_database_drift/app_database.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/model/event/theme_changed_event.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/module_starter/app_theme_module_starter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'modules/b_router/RTs.dart';
import 'package:cw2bit/infra/a_router/router.dart' as my_route;

void main() {
  DefaultAppStarter.run(
    const MyApp(),
    preprocessed: () {
      /// 初始化路由
      RTs.createRoutePage();
    },
    initCompleted: () {
      /// 初始化数据库
      DatabaseMgr.initialDatabase();

      /// 模块初始化 =0=
      AppThemeModuleStarter().setup();

      /// 模块初始化 =1=

      /// 初始化业务数据
      Apis.create_apis();
      Apis.create_services();
    },
    processAfterRunApp: () {
      /// 配置easyloading配置
      ///
    },
    errorReporter: _errorReporter,
  );
}

void _errorReporter(FlutterErrorDetails details) {
  FlutterError.dumpErrorToConsole(details);
  q0_.log.error(details);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// MaterialApp组件中，home、initialRoute和routes的区别：
  /// https://blog.csdn.net/shiyangkai/article/details/124275204

  @override
  Widget build(BuildContext context) {
    INKs.events.subscribe<ThemeChangedEvent>((newTheme) {
      INKToast.show('切换主题：${newTheme.name}');
      Get.appUpdate();
    });

    return GetMaterialApp(
            title: '𝕚𝗡𝕜.',
            scrollBehavior: const CupertinoScrollBehavior(),
            themeMode: ThemeMode.system,
            initialRoute: RTs.home.routeName,
            getPages: my_route.Router.getxPages,
            debugShowCheckedModeBanner: !INKs.isReleaseMode,
            enableLog: !INKs.isReleaseMode,
            builder: EasyLoading.init())
        .withSmartRefreshConfiguration(
          hideFooterWhenNotFull: false,
          enableLoadingWhenNoData: true,
          headerBuilder: () => const ClassicHeader(
            releaseText: '释放开始刷新...',
            refreshingText: '刷新中...',
            completeText: '刷新完成...',
            failedText: '刷新失败...',
            idleText: '继续深潜...',
          ),
          footerBuilder: () => const ClassicFooter(
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
