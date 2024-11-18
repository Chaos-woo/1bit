import 'package:get/get.dart';

abstract class PagingState<T> {
  /// 当前页
  int current_page = 1;

  /// 分页数量，可修改
  int get page_size => 20;

  /// 每次请求的数量
  int fetch_total = 0;

  /// 下一页
  int get next_page => current_page + 1;

  /// 分页数据
  RxList<T> data_list = <T>[].obs;

  /// 是否需要请求更多
  bool is_load_more() => data_list.length < fetch_total;
}

class EasyPageState<T> extends PagingState<T> {
  int size;

  EasyPageState.create({
    this.size = 20,
  });

  @override
  int get page_size => size;
}
