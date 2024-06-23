import 'package:url_launcher/url_launcher.dart';

/// 启动器
class QLauncher {
  /// 打开链接
  Future<void> launch(
    String url, {
    Function()? onCanLaunchPre,
    Function()? onNotSupportLaunch,
  }) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      onCanLaunchPre?.call();
      await launchUrl(uri);
    } else {
      onNotSupportLaunch?.call();
    }
  }

  /// 调起拨号页
  Future<void> launchTel(
    String phone, {
    Function()? onCanLaunchPre,
    Function()? onNotSupportLaunch,
  }) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      onCanLaunchPre?.call();
      await launchUrl(uri);
    } else {
      onNotSupportLaunch?.call();
    }
  }
}
