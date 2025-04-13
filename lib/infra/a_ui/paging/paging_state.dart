import 'package:get/get.dart';

abstract class PagingState<T> {
  /// 当前页
  int page = 1;

  /// 分页数量，可修改
  int get count => 20;

  /// 每次请求的数量
  int fetchCount = 0;

  /// 下一页
  int get nextPage => page + 1;

  /// 分页数据
  RxList<T> dataList = <T>[].obs;

  /// 是否需要请求更多
  bool isLoadMore() => dataList.length < fetchCount;
}

class EasyPageState<T> extends PagingState<T> {
  int size;

  EasyPageState.create({
    this.size = 20,
  });

  @override
  int get count => size;
}
