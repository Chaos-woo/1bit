
import 'package:package_info_plus/package_info_plus.dart';

/// 应用包信息
class AppPackage {
  static PackageInfo? _package;

  static Future<void> init() async {
    _package = await PackageInfo.fromPlatform();
  }

  PackageInfo get package => _package!;
}