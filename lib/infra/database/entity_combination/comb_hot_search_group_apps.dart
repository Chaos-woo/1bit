import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';

class CombHotSearchGroupApps {
  final HotSearchGroup group;
  final List<HotSearchApp> apps;

  CombHotSearchGroupApps({required this.group, required this.apps});
}
