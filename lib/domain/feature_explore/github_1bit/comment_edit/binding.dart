import 'package:cw2bit/domain/feature_explore/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class Github1bitCommentEditPageBinding extends Bindings {
  @override
  void dependencies() {
    IssuesModel issuesModel = q0_.route.argument().force_as();
    Get.lazyPut(() {
      var logic = Github1bitCommentEditLogic();
      logic.state.issuesModel = issuesModel;
      return logic;
    });
  }
}
