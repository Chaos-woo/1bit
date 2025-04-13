import 'package:oktoast/oktoast.dart';

class Toast {
  void show(
    String msg, {
    ToastPosition? position,
  }) {
    showToast(
      msg,
      position: position ?? ToastPosition.center,
    );
  }

  void dismissAll() {
    dismissAllToast();
  }
}
