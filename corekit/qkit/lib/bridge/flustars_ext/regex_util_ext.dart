import 'package:flustars_flutter3/flustars_flutter3.dart';

extension QBridgeRegexUtilExt on RegexUtil {
  ///Return whether input matches regex of simple mobile.
  bool isMobileSimple(String input) => RegexUtil.isMobileSimple(input);

  ///Return whether input matches regex of exact mobile.
  bool isMobileExact(String input) => RegexUtil.isMobileExact(input);

  /// Return whether input matches regex of telephone number.
  bool isTel(String input) => RegexUtil.isTel(input);

  /// Return whether input matches regex of id card number.
  bool isIDCard(String input) => RegexUtil.isIDCard(input);

  /// Return whether input matches regex of id card number which length is 15.
  bool isIDCard15(String input) => RegexUtil.isIDCard15(input);

  /// Return whether input matches regex of id card number which length is 18.
  bool isIDCard18(String input) => RegexUtil.isIDCard18(input);

  ///Return whether input matches regex of exact id card number which length is 18.
  bool isIDCard18Exact(String input) => RegexUtil.isIDCard18Exact(input);

  /// Return whether input matches regex of email.
  bool isEmail(String input) => RegexUtil.isEmail(input);

  /// Return whether input matches regex of url.
  bool isURL(String input) => RegexUtil.isURL(input);

  /// Return whether input matches regex of Chinese character.
  bool isZh(String input) => RegexUtil.isZh(input);

  /// Return whether input matches regex of date which pattern is 'yyyy-MM-dd'.
  bool isDate(String input) => RegexUtil.isDate(input);

  /// Return whether input matches regex of ip address.
  bool isIP(String input) => RegexUtil.isIP(input);

  /// Return whether input matches regex of username.
  bool isUserName(String input, {String regex = RegexUtil.regexUsername}) => RegexUtil.isUserName(input, regex: regex);

  /// Return whether input matches regex of QQ.
  bool isQQ(String input) => RegexUtil.isQQ(input);

  ///Return whether input matches regex of Passport.
  bool isPassport(String input) => RegexUtil.isPassport(input);

  bool matches(String regex, String input) => RegexUtil.matches(regex, input);
}
