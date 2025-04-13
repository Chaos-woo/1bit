import 'package:cw2bit/modules/b_database_drift/app_database.dart';

/// 业务依赖统一管理
final class DPs {
  DPs._();

  static final database = DatabaseMgr.getx;
  static final repository = RepositoryMgr.getx;

// 领域Provider
}
