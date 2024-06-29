import 'package:oktoast/oktoast.dart';

class Toast {
  void show(String msg) {
    showToast(msg);
  }

  void dismissAll() {
    dismissAllToast();
  }
}
