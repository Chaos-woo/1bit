import 'package:cw2bit/infra/a_ui/toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class INKLoader {
  /// 样式设置参考：https://github.com/nslogx/flutter_easyloading/blob/develop/README-zh_CN.md
  /// EasyLoading.instance
  ///   ..displayDuration = const Duration(milliseconds: 2000)
  ///   ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  ///   ..loadingStyle = EasyLoadingStyle.dark
  ///   ..indicatorSize = 45.0
  ///   ..radius = 10.0
  ///   ..progressColor = Colors.yellow
  ///   ..backgroundColor = Colors.green
  ///   ..indicatorColor = Colors.yellow
  ///   ..textColor = Colors.yellow
  ///   ..maskColor = Colors.blue.withOpacity(0.5)
  ///   ..userInteractions = true
  ///   ..dismissOnTap = false
  ///   ..customAnimation = CustomAnimation();

  static void show({String? loadingText}) {
    EasyLoading.show(status: loadingText);
  }

  static void dismiss({String? dismissText}) {
    EasyLoading.dismiss();
    if (dismissText != null && dismissText.isNotEmpty) {
      INKToast.show(dismissText);
    }
  }
}

/// 方法执行时显示loading状态
extension FunctionUiLoadingExt on Function {
  void loadingUi({String? loadingText}) async {
    INKLoader.show(loadingText: loadingText);
    try {
      await call();
    } catch (e) {
      rethrow;
    } finally {
      INKLoader.dismiss();
    }
  }
}
