import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class Github1bitIssuesDetailBinding extends Bindings {
  @override
  void dependencies() {
    IssuesModel issuesModel = QKit.route.argument() as IssuesModel;
    Get.lazyPut(() {
      var logic = Github1bitIssuesDetailLogic();
      logic.state.issues_model = issuesModel;
      return logic;
    });
  }
}
