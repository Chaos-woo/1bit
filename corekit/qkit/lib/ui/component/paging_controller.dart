import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:qkit/qkit.dart';

abstract class PagingController<S extends PagingState> extends GetxController {
  /// 状态
  late S state;

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  @override
  void onInit() {
    super.onInit();

    state = createPagingState();

    /// 初始化每次最大请求数量
    state.fetchTotal = state.pageSize;
  }

  /// 初始化分页状态
  S createPagingState();

  void onRefresh() {
    _fetchDataList(isRefresh: true).then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
      if (!state.isLoadMore()) {
        refreshController.loadNoData();
      }
    }).catchError((err) {
      QKit.log.error(err);
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    if (state.isLoadMore()) {
      /// 当前已有数据小于page*size时，继续请求数据
      _fetchDataList().then((_) {
        refreshController.loadComplete();
      }).catchError((_) {
        refreshController.loadFailed();
      });
    } else {
      refreshController.loadNoData();
    }
  }

  /// 拉取数据
  Future<void> _fetchDataList({bool isRefresh = false}) async {
    var result = await fetchData();

    if (isRefresh == true) {
      state.currPage = 1;

      /// 记录每次刷新
      state.fetchTotal = result.length;
      state.dataList.clear();
    } else {
      state.currPage++;
    }

    state.dataList.addAll(result);
  }

  /// 获取数据
  Future<List> fetchData();

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
}

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
