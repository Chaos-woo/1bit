import 'dart:convert';
import 'dart:typed_data';

import 'package:cw2bit/domain/bing/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/github_api.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class BingMgr extends GetxService {
  static final String tag = '#bingMgr';

  static BingMgr get singl => Get.find(tag: tag);

  Future<String?> get_bing_daily_image() async {
    var img_data = QKit.bridge.flustars.preferences.getObject(k_pref_bing_img_data) ?? {};
    var need_refresh = img_data.isEmpty ||
        DateTime.now().millisecondsSinceEpoch - img_data['expire_timestamp'] > c_bing_img_url_expires_millis;
    if (need_refresh) {
      var markdown_content = (await GithubApi.singl.get_content(
            c_bing_daily_img_owner,
            c_bing_daily_img_repo,
            c_bing_daily_img_path,
          ))
              .content ??
          '';

      if (markdown_content.isEmpty) {
        return null;
      } else {
        Uint8List decoded_bytes = base64.decode(markdown_content.replaceAll('\n', ''));
        String decoded_string = utf8.decode(decoded_bytes);
        RegExp regExp = RegExp(r'https:\/\/cn\.bing\.com\/th\?id=OHR\.[^&]+\.jpg&w=\d+');

        // 查找所有匹配的链接
        Iterable<Match> matches = regExp.allMatches(decoded_string);

        var img_url = matches.first.group(0);
        var new_img_data = {
          'url': img_url,
          'expire_timestamp': DateTime.now().millisecondsSinceEpoch + c_bing_img_url_expires_millis,
        };
        QKit.bridge.flustars.preferences.putObject(k_pref_bing_img_data, new_img_data);
        return img_url;
      }
    } else {
      return img_data['url'];
    }
  }
}
