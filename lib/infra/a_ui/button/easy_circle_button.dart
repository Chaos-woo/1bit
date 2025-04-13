import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_ui/button/circle_button.dart';
import 'package:flutter/material.dart';

final class INKEasyCircleBtn {
  INKEasyCircleBtn._();

  static INKCircleButton back({dynamic Function()? onBack}) {
    return INKCircleButton(
        icon: Icons.arrow_back_ios_new_rounded,
        onTap: () {
          INKs.router.back(backResult: onBack?.call());
        });
  }
}
