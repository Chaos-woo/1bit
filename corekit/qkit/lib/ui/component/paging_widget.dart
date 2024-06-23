import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'paging_controller.dart';

/// 刷新组件构造器
typedef QPagingRefreshWidgetBuilder<T extends QPagingController> = Widget Function(T controller);

class QPaging {
  static Widget buildRefresher<T extends QPagingController>(
    T controller, {
    required QPagingRefreshWidgetBuilder builder,
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
