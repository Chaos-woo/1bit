import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:qkit/qkit.dart';

abstract class PagingController<S extends PagingState> extends GetxController {
  /// 状态
  late S state;

  late final RefreshController refreshController;

  @override
  void onInit() {
    super.onInit();

    refreshController = RefreshController(
      initialRefresh: is_init_refresh,
    );

    state = createPagingState();

    /// 初始化每次最大请求数量
    state.fetchTotal = state.pageSize;
  }

  /// 初始化分页状态
  S createPagingState();

  void on_refresh() {
    _fetch_data(isRefresh: true).then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
      if (!state.isLoadMore()) {
        refreshController.loadNoData();
      }

      QKit.delay.delay(() {
        on_refresh_listener(true, true);
      });
    }).catchError((err) {
      QKit.log.error(err);
      refreshController.refreshFailed();

      QKit.delay.delay(() {
        on_refresh_listener(true, false);
      });
    });
  }

  void on_loading() {
    if (state.isLoadMore()) {
      /// 当前已有数据小于page*size时，继续请求数据
      _fetch_data().then((_) {
        refreshController.loadComplete();

        QKit.delay.delay(() {
          on_refresh_listener(false, true);
        });
      }).catchError((_) {
        refreshController.loadFailed();

        QKit.delay.delay(() {
          on_refresh_listener(false, false);
        });
      });
    } else {
      refreshController.loadNoData();
    }
  }

  /// 拉取数据
  Future<void> _fetch_data({bool isRefresh = false}) async {
    var result = await fetch_data();

    if (isRefresh == true) {
      state.currPage = 1;

      /// 记录每次刷新
      state.fetchTotal = result.length;
      state.data_list.clear();
    } else {
      state.currPage++;
    }

    state.data_list.addAll(result);
  }

  /// 请求刷新
  void request_refresh() {
    refreshController.requestRefresh(
      duration: 100.milliseconds,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  void dispose() {
    super.dispose();

    /// 释放RefreshController
    refreshController.dispose();
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
