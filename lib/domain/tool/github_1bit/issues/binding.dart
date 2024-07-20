import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_1bit_issues_list/logic.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Github1bitIssuesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Github1bitIssuesLogic());
    Get.lazyPut(() => Github1bitIssuesListLogic());
  }
}
