import 'package:cw2bit/infrastructure/database/r_database.dart';

/// 缺失QDB引用的来这里获取import
mixin R1DatabaseMixin {
  AppDatabase get database => DatabaseMgr.getx;

  $HotSearchAppsTable get hotSearchApps => database.hotSearchApps;

  $HotSearchGroupsTable get hotSearchGroups => database.hotSearchGroups;

  $HotSearchGroupHasAppsTable get hotSearchGroupHasApps => database.hotSearchGroupHasApps;

  $WebpageReadingsTable get webpageReadings => database.webpageReadings;

  $WebpageReadingHasStickersTable get webpageReadingHasSticker => database.webpageReadingHasStickers;

  $StickersTable get stickers => database.stickers;
}
