import 'dart:convert';
import 'dart:typed_data';

import 'package:cw2bit/modules/microsoft_bing/values/constant.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class BingMgr extends GetxService {
  static final String getx_tag = '__getx_bing_mgr__';

  static BingMgr get getx => Get.find(tag: getx_tag);

  static const _c_k_bing_img_url = 'url';
  static const _c_k_bing_img_expire_timestamp = 'expire_timestamp';

  static bool m_show_bing_daily_image = false;

  Future<String?> get_bing_daily_image() async {
    var img_data = q0_.bridge.flustars.preferences.getObject(k_pfs_bing_img_data);

    print('img_data: $img_data');

    var need_refresh = img_data == null ||
        img_data[_c_k_bing_img_url] == null ||
        ((img_data[_c_k_bing_img_url] as String).isBlank!) ||
        DateTime.now().millisecondsSinceEpoch - (img_data[_c_k_bing_img_expire_timestamp] ?? 0) >
            c_bing_img_url_expires_millis;

    print('need_refresh: $need_refresh');

    if (need_refresh) {
      var markdown_content = (await c0_.api_github.get_content(
            c_bing_daily_img_owner,
            c_bing_daily_img_repo,
            c_bing_daily_img_path,
          ))
              .content ??
          '';

      if (markdown_content.isEmpty) {
        m_show_bing_daily_image = false;
        return null;
      } else {
        Uint8List decoded_bytes = base64.decode(markdown_content.replaceAll('\n', ''));
        String decoded_string = utf8.decode(decoded_bytes);
        RegExp regExp = RegExp(r'https:\/\/cn\.bing\.com\/th\?id=OHR\.[^&]+\.jpg&w=\d+');

        // 查找所有匹配的链接
        Iterable<Match> matches = regExp.allMatches(decoded_string);

        var img_url = matches.first.group(0);
        var new_img_data = {
          _c_k_bing_img_url: img_url,
          _c_k_bing_img_expire_timestamp: DateTime.now().millisecondsSinceEpoch + c_bing_img_url_expires_millis,
        };
        q0_.bridge.flustars.preferences.putObject(k_pfs_bing_img_data, new_img_data);
        m_show_bing_daily_image = true;
        return img_url;
      }
    } else {
      m_show_bing_daily_image = true;
      return img_data[_c_k_bing_img_url];
    }
  }
}
