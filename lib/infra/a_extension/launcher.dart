import 'package:url_launcher/url_launcher.dart';

/// 启动器
final class INKLauncher {
  /// 打开链接
  Future<void> launch(
    String url, {
    Function()? onLaunchBefore,
    Function()? onLaunchFail,
  }) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      onLaunchBefore?.call();
      await launchUrl(uri);
    } else {
      onLaunchFail?.call();
    }
  }

  /// 调起拨号页
  Future<void> launchTel(
    String phone, {
    Function()? onLaunchBefore,
    Function()? onLaunchFail,
  }) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      onLaunchBefore?.call();
      await launchUrl(uri);
    } else {
      onLaunchFail?.call();
    }
    onLaunchFail?.call();
  }
}
