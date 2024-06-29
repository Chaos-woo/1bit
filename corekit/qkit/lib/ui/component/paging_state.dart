import 'package:get/get.dart';

abstract class PagingState<T> {
  /// 当前页
  int currPage = 1;

  /// 分页数量，可修改
  int get pageSize => 20;

  /// 每次请求的数量
  int fetchTotal = 0;

  /// 下一页
  int get nextPage => currPage + 1;

  /// 分页数据
  RxList<T> dataList = <T>[].obs;

  /// 是否需要请求更多
  bool isLoadMore() => dataList.length < fetchTotal;
}

class SimplePageState<T> extends PagingState<T> {
  int size;

  SimplePageState.create({
    this.size = 20,
  });

  @override
  int get pageSize => size;
}
