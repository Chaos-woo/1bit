import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'state.dart';

class Github1bitCommentEditLogic extends GetxController {
  final Github1bitCommentEditState state = Github1bitCommentEditState();

  late TextEditingController textController;

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController(text: '');
  }

  /// 提交评论
  Future<bool> post() async {
    if (textController.text.isEmpty) {
      return false;
    }

    await Apis.github.postComment(
      state.owner,
      state.repo,
      state.issuesModel.number,
      textController.text,
    );
    return true;
  }
}
