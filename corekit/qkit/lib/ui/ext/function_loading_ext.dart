import 'package:qkit/qkit.dart';

/// 方法执行时显示loading状态
extension FunctionUiLoadingExt on Function {
  void loadingUi({String? loadingText}) async {
    q0_.ui.loading.show(loading_tip: loadingText);
    try {
      await call();
    } catch (e) {
      rethrow;
    } finally {
      q0_.ui.loading.dismiss();
    }
  }
}
