import 'package:cw2bit/infrastructure/database/r1db.dart';

/// 缺失QDB引用的来这里获取import
mixin R1DatabaseImportMixin {
  AppDatabase get database => R1DatabaseMgr.singl;
}
