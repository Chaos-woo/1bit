import 'package:cw2bit/modules/b_database_drift/app_database.dart';
import 'package:cw2bit/modules/c_module_theme/theme/themes.dart';

/// 业务依赖统一管理
final class DPs {
  DPs._();

  static final theme = ThemesMgr.getx;
  static final database = DatabaseMgr.getx;
}
