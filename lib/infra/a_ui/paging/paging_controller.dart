import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_ui/paging/paging_state.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

abstract class PagingController<S extends PagingState> extends GetxController {
  /// 状态
  late S state;

  late final RefreshController refreshController;

  @override
  void onInit() {
    super.onInit();

    refreshController = RefreshController(
      initialRefresh: isInitRefresh,
    );

    state = createPagingState();

    /// 初始化每次最大请求数量
    state.fetchCount = state.count;
  }

  /// 初始化分页状态
  S createPagingState();

  void onRefresh() {
    _fetchData(isRefresh: true).then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
      if (!state.isLoadMore()) {
        refreshController.loadNoData();
      }
      INKs.tool.delay.run(() => onRefreshListener(true, true));
    }).catchError((err) {
      INKs.log.error(err);
      refreshController.refreshFailed();
      INKs.tool.delay.run(() => onRefreshListener(true, false));
    });
  }

  void onLoading() {
    if (state.isLoadMore()) {
      /// 当前已有数据小于page*size时，继续请求数据
      _fetchData().then((_) {
        refreshController.loadComplete();
        INKs.tool.delay.run(() => onRefreshListener(false, true));
      }).catchError((_) {
        refreshController.loadFailed();
        INKs.tool.delay.run(() => onRefreshListener(false, true));
      });
    } else {
      refreshController.loadNoData();
    }
  }

  /// 拉取数据
  Future<void> _fetchData({bool isRefresh = false}) async {
    var result = await fetchData();

    if (isRefresh == true) {
      state.page = 1;

      /// 记录每次刷新
      state.fetchCount = result.length;
      state.dataList.clear();
    } else {
      state.page++;
    }

    state.dataList.addAll(result);
  }

  /// 请求刷新
  void requestRefresh() {
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
  Future<List> fetchData();

  /// 监听刷新
  /// [isRefreshFetch]: true-刷新请求，false-加载请求
  /// [isFetchSuccess]: 是否请求成功
  Future<void> onRefreshListener(bool isRefreshFetch, bool isFetchSuccess) async {}

  /// 初始化时是否立即刷新
  bool get isInitRefresh => true;
}

/// 刷新监听器
/// [isRefreshFetch]: true-刷新请求，false-加载请求
/// [isFetchSuccess]: 是否请求成功
typedef OnRefreshedListener = Future<void> Function(bool isRefreshFetch, bool isFetchSuccess);

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
