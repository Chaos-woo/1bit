import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'paging_state.dart';

abstract class QPagingController<S extends QPagingState> extends GetxController {
  /// 状态
  late S state;

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  @override
  void onInit() {
    super.onInit();

    state = initPagingState();
    /// 初始化每次最大请求数量
    state.fetchTotal = state.pageSize;
  }

  /// 初始化分页状态
  S initPagingState();

  void onRefresh() {
    _fetchDataList(isRefresh: true).then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
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

  @override
  void dispose() {
    super.dispose();

    /// 释放RefreshController
    refreshController.dispose();
  }
}
