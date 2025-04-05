import 'package:cw2bit/infrastructure/database/app_database.dart';

/// 提供Database实例和表实例
mixin R1DatabaseMixin {
  AppDatabase get database => DatabaseMgr.getx;

  $HotSearchAppsTable get t_hot_search_apps => database.hotSearchApps;

  $HotSearchGroupsTable get t_hot_search_groups => database.hotSearchGroups;

  $HotSearchGroupHasAppsTable get t_hot_search_group_has_apps => database.hotSearchGroupHasApps;

  $WebpageReadingsTable get t_webpage_readings => database.webpageReadings;

  $WebpageReadingHasStickersTable get t_webpage_reading_has_stickers => database.webpageReadingHasStickers;

  $StickersTable get t_stickers => database.stickers;
}
