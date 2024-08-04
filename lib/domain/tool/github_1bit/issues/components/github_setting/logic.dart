import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

class GithubSettingLogic extends GetxController {
  final GithubSettingState state = GithubSettingState();

  /// 是否展示1bit仓库的信息
  /// 部分仅需设置Github Token的场景，不一定是1bit仓库的
  late bool _show1bitRepository;

  late TextEditingController repoOwnerTextController;
  late TextEditingController repoTextController;
  late TextEditingController access_token_text_Controller;

  void set show1bitRepository(bool? show) => _show1bitRepository = show ?? true;

  bool get show1bitRepository => _show1bitRepository;

  @override
  void onInit() {
    super.onInit();

    String? accessTokenPfs = QKit.bridge.flustars.preferences.getString(k_pref_github_access_key);

    repoOwnerTextController = TextEditingController(text: state.owner);
    repoTextController = TextEditingController(text: state.repo);
    access_token_text_Controller = TextEditingController(text: accessTokenPfs);
  }

  void save_github_access_token() {
    String accessToken = access_token_text_Controller.text;
    QKit.bridge.flustars.preferences.putString(k_pref_github_access_key, accessToken);
  }

  Future<bool> check_access_token() async {
    String accessToken = access_token_text_Controller.text;
    try {
      await Apis.github.check_access_token(state.owner, state.repo, accessToken);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
