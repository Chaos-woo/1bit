import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:qkit/bridge/index.dart';

/// 三方包桥接主类
/// 大多数为静态方法，在此声明仅为开发时提示已引入的工具类
/// 少部分可以通过该实例获取三方工具类中的成员属性或成员方法
class QBridge {
  /// flustars_flutter
  final FlustarsBridge flustars = FlustarsBridge();
}

/// flustars_flutter
class FlustarsBridge {
  /// screen_util屏幕工具桥接
  final ScreenUtil screen = ScreenUtil();

  /// regex_util正则表达式工具桥接
  final RegexUtil regex = RegexUtil();

  /// object_util判空工具桥接
  final ObjectUtil obj = ObjectUtil();

  /// date_util日期工具桥接
  final DateUtil date = DateUtil();

  /// num_util数字工具桥接
  final NumUtil num = NumUtil();

  /// money_util金额工具桥接
  final MoneyUtil money = MoneyUtil();

  /// json_util JSON工具桥接
  final JsonUtil json = JsonUtil();

  /// text_util文字工具桥接
  final TextUtil text = TextUtil();

  /// timeline_util时间线工具桥接
  final TimelineUtil timeline = TimelineUtil();

  /// 桥接SpUtil
  final QSpUtilExt sp = QSpUtilExt();
}
