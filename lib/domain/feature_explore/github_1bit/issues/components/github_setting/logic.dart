import 'package:cw2bit/domain/feature_explore/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

final class _PathVariables {
  String? get show_1bit_repo => q0_.route.path_variables(path_k_show_1bit_repo);

  String get path_k_show_1bit_repo => '__path_variables_show_1bit_repo__';
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

    String? access_token = q0_.bridge.flustars.preferences.get_string(k_pfs_github_access_key);

    repo_owner_text_controller = TextEditingController(text: state.owner);
    repo_text_controller = TextEditingController(text: state.repo);
    access_token_text_Controller = TextEditingController(text: access_token);
  }

  void save_github_access_token() {
    String access_token = access_token_text_Controller.text;
    q0_.bridge.flustars.preferences.putString(k_pfs_github_access_key, access_token);
  }

  Future<bool> check_access_token() async {
    String access_token = access_token_text_Controller.text;
    try {
      await c0_.api_github.check_access_token(state.owner, state.repo, access_token);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
