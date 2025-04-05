import 'OnUpgradeMigration.dart';

final class AppDataMigration {
  /// 数据库迁移器，每次新加迁移器需要在此处理
  static final List<OnUpgradeMigration> migrators = [];
}
