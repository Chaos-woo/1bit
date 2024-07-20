import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'paging_controller.dart';

/// 刷新组件构造器
typedef PagingRefreshWidgetBuilder<T extends PagingController> = Widget Function(T controller);

class PagingWidgetBuilder {
  static Widget buildRefresher<T extends PagingController>(
    T controller, {
    required PagingRefreshWidgetBuilder builder,
    bool enablePullDown = true,
    bool enablePullUp = true,
  }) {
    return GetX<T>(
      init: controller,
      builder: (pagingController) => SmartRefresher(
        enablePullDown: enablePullDown,
        enablePullUp: enablePullUp,
        controller: pagingController.refreshController,
        onRefresh: pagingController.onRefresh,
        onLoading: pagingController.onLoading,
        child: builder.call(pagingController),
      ),
    );
  }
}
