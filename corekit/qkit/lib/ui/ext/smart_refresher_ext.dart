import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

const _hideFooterWhenNotFull = true;
const _headerTriggerDistance = 80.0;
const _maxOverScrollExtent = 100.0;
const _footerTriggerDistance = 150.0;

extension SmartRefresherConfigExt on Widget {
  Widget smartRefreshConfiguration({
    Widget Function()? headerBuilder,
    Widget Function()? footerBuilder,
    bool hideFooterWhenNotFull = _hideFooterWhenNotFull,
    double headerTriggerDistance = _headerTriggerDistance,
    double maxOverScrollExtent = _maxOverScrollExtent,
    double footerTriggerDistance = _footerTriggerDistance,
  }) {
    return RefreshConfiguration(
      headerBuilder: headerBuilder ?? () => const ClassicHeader(),
      footerBuilder: footerBuilder ?? () => const ClassicFooter(),
      hideFooterWhenNotFull: hideFooterWhenNotFull,
      headerTriggerDistance: headerTriggerDistance,
      maxOverScrollExtent: maxOverScrollExtent,
      footerTriggerDistance: footerTriggerDistance,
      child: this,
    );
  }
}
