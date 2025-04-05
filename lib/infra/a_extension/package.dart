import 'package:package_info_plus/package_info_plus.dart';

/// 应用包信息
final class AppPackage {
  static PackageInfo? package;

  static Future<void> setup() async {
    package = await PackageInfo.fromPlatform();
  }

  /// 获取应用包信息对象.
  PackageInfo get getPackage => package!;

  /// 获取应用名称
  String get getAppName => package!.appName;

  /// 获取应用包名
  String get getPackageName => package!.packageName;

  /// 获取应用版本号
  String get getVersion => package!.version;

  /// 获取应用构建号
  String get getBuildNumber => package!.buildNumber;

  /// 获取应用构建签名
  String get getBuildSignature => package!.buildSignature;

  /// 获取应用版本号和构建号的组合
  String get getVersionAndBuildNumber => '${package!.version}-${package!.buildNumber}';
}
