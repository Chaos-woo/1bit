
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loader {
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

  void show({String? status}) {
    EasyLoading.show(status: status);
  }

  void dismiss() {
    EasyLoading.dismiss();
  }
}