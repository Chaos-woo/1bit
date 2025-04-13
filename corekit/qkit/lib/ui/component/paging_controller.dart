import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:qkit/qkit.dart';

abstract class PagingController<S extends PagingState> extends GetxController {
  /// 状态
  late S state;

  late final RefreshController refresh_controller;

  @override
  void onInit() {
    super.onInit();

    refresh_controller = RefreshController(
      initialRefresh: is_init_refresh,
    );

    state = create_paging_state();

    /// 初始化每次最大请求数量
    state.fetch_total = state.page_size;
  }

  /// 初始化分页状态
  S create_paging_state();

  void on_refresh() {
    _fetch_data(is_refresh: true).then((_) {
      refresh_controller.refreshCompleted(resetFooterState: true);
      if (!state.is_load_more()) {
        refresh_controller.loadNoData();
      }

      q0_.delay.delay(() {
        on_refresh_listener(true, true);
      });
    }).catchError((err) {
      q0_.log.error(err);
      refresh_controller.refreshFailed();

      q0_.delay.delay(() {
        on_refresh_listener(true, false);
      });
    });
  }

  void on_loading() {
    if (state.is_load_more()) {
      /// 当前已有数据小于page*size时，继续请求数据
      _fetch_data().then((_) {
        refresh_controller.loadComplete();

        q0_.delay.delay(() {
          on_refresh_listener(false, true);
        });
      }).catchError((_) {
        refresh_controller.loadFailed();

        q0_.delay.delay(() {
          on_refresh_listener(false, false);
        });
      });
    } else {
      refresh_controller.loadNoData();
    }
  }

  /// 拉取数据
  Future<void> _fetch_data({bool is_refresh = false}) async {
    var result = await fetch_data();

    if (is_refresh == true) {
      state.current_page = 1;

      /// 记录每次刷新
      state.fetch_total = result.length;
      state.data_list.clear();
    } else {
      state.current_page++;
    }

    state.data_list.addAll(result);
  }

  /// 请求刷新
  void request_refresh() {
    refresh_controller.requestRefresh(
      duration: 100.milliseconds,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  void dispose() {
    super.dispose();

    /// 释放RefreshController
    refresh_controller.dispose();
  }

  /// 获取数据
  Future<List> fetch_data();

  /// 监听刷新
  /// is_refresh_fetch: true-刷新请求，false-加载请求
  /// is_fetch_success: 是否请求成功
  Future<void> on_refresh_listener(bool is_refresh_fetch, bool is_fetch_success) async {}

  /// 初始化时是否立即刷新
  bool get is_init_refresh => true;
}

/// 刷新监听器
/// [is_refresh_fetch]: true-刷新请求，false-加载请求
/// [is_fetch_success]: 是否请求成功
typedef OnRefreshedListener = Future<void> Function(bool is_refresh_fetch, bool is_fetch_success);

// class D {}
//
// class PCtrl extends PagingController<SimplePageState<D>> {
//   @override
//   SimplePageState<D> createPagingState() {
//     return SimplePageState<D>.create();
//   }
//
//   @override
//   Future<List> fetchData() {
//     // TODO: implement fetchData
//     throw UnimplementedError();
//   }
//
// }
