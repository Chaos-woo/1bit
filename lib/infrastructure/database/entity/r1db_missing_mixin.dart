import 'package:cw2bit/infrastructure/database/r1db.dart';

/// 缺失QDB引用的来这里获取import
mixin R1DBMissingImport {
  /// 无意义的mixin，仅用于标识
  AppDatabase get missing => R1DatabaseMgr.singl;
}
