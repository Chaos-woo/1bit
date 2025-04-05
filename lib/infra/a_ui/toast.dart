import 'package:oktoast/oktoast.dart';

class INKToast {
  static void show(
    String msg, {
    ToastPosition? position,
  }) {
    showToast(
      msg,
      position: position ?? ToastPosition.center,
    );
  }

  static void dismissAll() {
    dismissAllToast();
  }
}
