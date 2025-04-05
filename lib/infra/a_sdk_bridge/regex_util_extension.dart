import 'package:flustars_flutter3/flustars_flutter3.dart';

extension RegexBridge on RegexUtil {
  /// 验证输入是否匹配简单的手机号正则。
  bool isMobileSimple(String input) => RegexUtil.isMobileSimple(input);

  /// 验证输入是否匹配精确的手机号正则。
  bool isMobileExact(String input) => RegexUtil.isMobileExact(input);

  /// 验证输入是否匹配电话号码正则。
  bool isTel(String input) => RegexUtil.isTel(input);

  /// 验证输入是否匹配身份证号码正则。
  bool isIdCard(String input) => RegexUtil.isIDCard(input);

  /// 验证输入是否匹配15位身份证号码正则。
  bool isIdCard15(String input) => RegexUtil.isIDCard15(input);

  /// 验证输入是否匹配18位身份证号码正则。
  bool isIdCard18(String input) => RegexUtil.isIDCard18(input);

  /// 验证输入是否匹配精确的18位身份证号码正则。
  bool isIdCard18Exact(String input) => RegexUtil.isIDCard18Exact(input);

  /// 验证输入是否匹配邮箱正则。
  bool isEmail(String input) => RegexUtil.isEmail(input);

  /// 验证输入是否匹配URL正则。
  bool isUrl(String input) => RegexUtil.isURL(input);

  /// 验证输入是否匹配中文字符正则。
  bool isZh(String input) => RegexUtil.isZh(input);

  /// 验证输入是否匹配日期正则，日期格式为 'yyyy-MM-dd'。
  bool isDate(String input) => RegexUtil.isDate(input);

  /// 验证输入是否匹配IP地址正则。
  bool isIp(String input) => RegexUtil.isIP(input);

  /// 验证输入是否匹配用户名正则。
  bool isUserName(String input, {String regex = RegexUtil.regexUsername}) => RegexUtil.isUserName(input, regex: regex);

  /// 验证输入是否匹配QQ号码正则。
  bool isQq(String input) => RegexUtil.isQQ(input);

  /// 验证输入是否匹配护照号码正则。
  bool isPassport(String input) => RegexUtil.isPassport(input);

  bool matches(String regex, String input) => RegexUtil.matches(regex, input);
}
