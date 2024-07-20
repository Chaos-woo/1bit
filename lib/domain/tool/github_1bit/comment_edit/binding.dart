import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/github_models.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class Github1bitCommentEditPageBinding extends Bindings {
  @override
  void dependencies() {
    IssuesModel issuesModel = QKit.route.argument() as IssuesModel;
    Get.lazyPut(() {
      var logic = Github1bitCommentEditLogic();
      logic.state.issuesModel = issuesModel;
      return logic;
    });
  }
}
