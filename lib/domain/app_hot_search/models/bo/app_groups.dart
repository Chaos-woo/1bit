import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app_group.dart';

/// 本地APP分组数据
class LocalAppGroups {
  final List<LocalAppGroup> groups;

  LocalAppGroups.from(this.groups);
}

class LocalAppGroup {
  final FavoriteAppGroup group;
  final List<FavoriteApp> apps;

  LocalAppGroup({required this.group, required this.apps});
}
