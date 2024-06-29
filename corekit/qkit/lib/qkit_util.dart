
import 'package:qkit/qkit.dart';

class QKit {
  /// 三方包桥接类
  static final KitBridge bridge = KitBridge();

  static final PPLog log = PPLog.singl;

  /// 事件总线
  static final Eventbus eventbus = Eventbus();

  /// GetX路由工具
  static final RouteProxyKit route = RouteProxyKit();

  /// 紧凑数字工具
  static final CompactNumber compactNumber = CompactNumber();

  /// 延时工具
  static final Delayer delay = Delayer();

  /// 应用包信息
  static final AppPackage package = AppPackage();

  /// 应用终端设备信息
  static final MobileDevice mobileDevice = MobileDevice();

  /// 应用存储信息
  static final StorageDirectory directory = StorageDirectory();

  /// 启动器
  static final Launcher launcher = Launcher();

  /// id生成器
  static final IdGenerator idGen = IdGenerator();

  /// 移动网络信号
  static final MobileNetwork network = MobileNetwork();

  /// 系统权限
  static final Permissions permission = Permissions();

  /// SystemChrome
  static final SystemChromes systemChrome = SystemChromes();

  /// 主题
  static final Themes theme = Themes();
  
  /// 简单的UI小工具
  static final ui = QUi();

  QKit._();
}