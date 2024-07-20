import 'package:cw2bit/domain/tool/github_1bit/issues/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

class GithubSettingLogic extends GetxController {
  final GithubSettingState state = GithubSettingState();

  late TextEditingController repoOwnerTextController;
  late TextEditingController repoTextController;
  late TextEditingController accessTokenTextController;

  @override
  void onInit() {
    super.onInit();

    String? accessTokenPfs = QKit.bridge.flustars.preferences.getString(k_githubAccessKey);

    repoOwnerTextController = TextEditingController(text: state.owner);
    repoTextController = TextEditingController(text: state.repo);
    accessTokenTextController = TextEditingController(text: accessTokenPfs);
  }

  void saveAccessToken() {
    String accessToken = accessTokenTextController.text;
    QKit.bridge.flustars.preferences.putString(k_githubAccessKey, accessToken);
  }
}
