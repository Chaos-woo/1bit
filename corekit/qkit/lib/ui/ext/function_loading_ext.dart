import 'package:qkit/qkit.dart';

/// 方法执行时显示loading状态
extension FunctionUiLoadingExt on Function {
  void loadingUi({String? loadingText}) async {
    QUi.loading.show(status: loadingText);
    try {
      await call();
    } catch (e) {
      rethrow;
    } finally {
      QUi.loading.dismiss();
    }
  }
}
