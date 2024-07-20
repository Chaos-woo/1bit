import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

// Viewport不满一屏时,禁用上拉加载更多功能
const _hideFooterWhenNotFull = true;
// 在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
const _enableLoadingWhenFailed = true;
// 已经无数据的情况下,用户仍然可以通过手势上拉来触发加载更多
const _enableLoadingWhenNoData = false;
const _headerTriggerDistance = 80.0;
const _maxOverScrollExtent = 100.0;
const _footerTriggerDistance = 0.0;

extension SmartRefresherConfigExt on Widget {
  Widget smartRefreshConfiguration({
    Widget Function()? headerBuilder,
    Widget Function()? footerBuilder,
    bool hideFooterWhenNotFull = _hideFooterWhenNotFull,
    double headerTriggerDistance = _headerTriggerDistance,
    double maxOverScrollExtent = _maxOverScrollExtent,
    double footerTriggerDistance = _footerTriggerDistance,
    bool enableLoadingWhenFailed = _enableLoadingWhenFailed,
    bool enableLoadingWhenNoData = _enableLoadingWhenNoData,
  }) {
    return RefreshConfiguration(
      headerBuilder: headerBuilder ?? () => const ClassicHeader(),
      footerBuilder: footerBuilder ?? () => const ClassicFooter(),
      hideFooterWhenNotFull: hideFooterWhenNotFull,
      headerTriggerDistance: headerTriggerDistance,
      maxOverScrollExtent: maxOverScrollExtent,
      footerTriggerDistance: footerTriggerDistance,
      enableLoadingWhenFailed: enableLoadingWhenFailed,
      enableLoadingWhenNoData: enableLoadingWhenNoData,
      child: this,
    );
  }
}
