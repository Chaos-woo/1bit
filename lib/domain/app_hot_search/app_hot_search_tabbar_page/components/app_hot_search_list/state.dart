import 'package:cw2bit/domain/app_hot_search/app_hot_search_tabbar_page/models/hot_search_model.dart';

class AppHotSearchListState {
  /// 当前APP
  String app = '';

  /// 热搜列表
  List<HotSearchModel> _m_hot_search_list = [];

  /// 热搜原始数据列表
  List<HotSearchModel> _m_original_hot_search_list = [];

  List<HotSearchModel> get hot_search_list => _m_hot_search_list;

  void set_original_hot_search_list(List<HotSearchModel> models) {
    _m_original_hot_search_list = models;
    _m_hot_search_list = models;
  }

  AppHotSearchListState() {
    ///Initialize variables
  }
}
