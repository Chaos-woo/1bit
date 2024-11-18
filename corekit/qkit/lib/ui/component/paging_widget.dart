import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'paging_controller.dart';

/// 刷新组件构造器
typedef PagingRefreshWidgetBuilder<T extends PagingController> = Widget Function(T controller);

class PagingWidgetBuilder {
  static Widget build_refresher<T extends PagingController>(
    T controller, {
    required PagingRefreshWidgetBuilder builder,
    bool enablePullDown = true,
    bool enablePullUp = true,
  }) {
    return GetX<T>(
      init: controller,
      builder: (paging_controller) => SmartRefresher(
        enablePullDown: enablePullDown,
        enablePullUp: enablePullUp,
        controller: paging_controller.refresh_controller,
        onRefresh: paging_controller.on_refresh,
        onLoading: paging_controller.on_loading,
        child: builder.call(paging_controller),
      ),
    );
  }
}
