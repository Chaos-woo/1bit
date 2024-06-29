import 'package:permission_handler/permission_handler.dart';

/// 系统权限
class Permissions {
  Future<void> check(
    Permission permission, {
    Function()? onGranted,
    bool deniedAutoRequest = true,
    Function()? onDenied,
    Function()? onRestricted,
    Function()? onPermanentlyDenied,
  }) async {
    var status = await permission.status;
    if (status.isDenied) {
      /// 如果权限被拒绝，可以尝试再次请求权限
      onDenied?.call();
      if (deniedAutoRequest) {
        request(
          permission,
          onGranted: onGranted,
        );
      }
    } else if (status.isGranted) {
      /// 已经授予了权限
      onGranted?.call();
    } else if (status.isRestricted) {
      /// 如果权限受到限制，例如家长控制，则需要用户进行额外的操作
      onRestricted?.call();
    } else if (status.isPermanentlyDenied) {
      /// 如果权限被永久拒绝，则需要用户手动启用权限
      onPermanentlyDenied?.call();
      openAppSettings();
    }
  }

  Future<void> request(
    Permission permission, {
    Function()? onGranted,
    Function()? onDenied,
    Function()? onPermanentlyDenied,
  }) async {
    var status = await permission.request();
    if (status.isGranted) {
      /// 用户授予了权限
      onGranted?.call();
    } else if (status.isDenied) {
      /// 用户拒绝了权限
      onDenied?.call();
    } else if (status.isPermanentlyDenied) {
      /// 用户永久拒绝了权限，需要手动启用权限
      onPermanentlyDenied?.call();
      openAppSettings();
    }
  }
}
