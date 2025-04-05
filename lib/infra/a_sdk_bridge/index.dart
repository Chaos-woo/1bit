import 'package:cw2bit/infra/a_sdk_bridge/keyboard_extension.dart';
import 'package:cw2bit/infra/a_sdk_bridge/sputil_extension.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';

final class INKSdk {
  /// screen_util屏幕工具桥接
  final ScreenUtil screen = ScreenUtil();

  /// regex_util正则表达式工具桥接
  final RegexUtil regex = RegexUtil();

  /// object_util判空工具桥接
  final ObjectUtil object = ObjectUtil();

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

  /// SpUtil缓存工具桥接
  final SpUtilBridge preferences = SpUtilBridge();

  /// 键盘工具
  final Keyboard keyboard = Keyboard();
}
