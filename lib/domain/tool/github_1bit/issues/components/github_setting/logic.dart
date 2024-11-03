import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

final class _PathVariables {
  static const _c_show_1bit_repo = 'show_1bit_repo';

  String? get show_1bit_repo => QKit.route.path_variables(_c_show_1bit_repo);

  String get show_1bit_repo_value => _c_show_1bit_repo;
}

class GithubSettingLogic extends GetxController {
  static final _PathVariables m_path_variables = _PathVariables();

  final GithubSettingState state = GithubSettingState();

  /// 是否展示1bit仓库的信息
  /// 部分仅需设置Github Token的场景，不一定是1bit仓库的
  late bool _show_1bit_repository;

  late TextEditingController repo_owner_text_controller;
  late TextEditingController repo_text_controller;
  late TextEditingController access_token_text_Controller;

  void set show_1bit_repository(bool? show) => _show_1bit_repository = show ?? true;

  bool get show_1bit_repository => _show_1bit_repository;

  @override
  void onInit() {
    super.onInit();

    String? access_token_pfs = QKit.bridge.flustars.preferences.getString(k_pref_github_access_key);

    repo_owner_text_controller = TextEditingController(text: state.owner);
    repo_text_controller = TextEditingController(text: state.repo);
    access_token_text_Controller = TextEditingController(text: access_token_pfs);
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
