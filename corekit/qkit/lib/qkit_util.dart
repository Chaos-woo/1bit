
import 'package:qkit/qkit.dart';

class QKit {
  /// 三方包桥接类
  static final QBridge bridge = QBridge();

  static final PPLog logger = PPLog.singl;

  /// 事件总线
  static final QEventBus eventBus = QEventBus();

  /// GetX路由工具
  static final QRouterKit route = QRouterKit();

  /// 紧凑数字工具
  static final QCompactNumber compactNumber = QCompactNumber();

  /// 延时工具
  static final QDelay delay = QDelay();

  /// 应用包信息
  static final QPackage package = QPackage();

  /// 应用终端设备信息
  static final QMobileDevice mobileDevice = QMobileDevice();

  /// 应用存储信息
  static final QStorageDirectory directory = QStorageDirectory();

  /// 启动器
  static final QLauncher launcher = QLauncher();

  /// id生成器
  static final QIdGen idGen = QIdGen();

  /// 移动网络信号
  static final QMobileNetwork network = QMobileNetwork();

  /// 系统权限
  static final QPermission permission = QPermission();

  /// SystemChrome
  static final QSystemChrome systemChrome = QSystemChrome();

  /// 主题
  static final QTheme theme = QTheme();
  
  /// 简单的UI小工具
  static final ui = QUi();

  QKit._();
}