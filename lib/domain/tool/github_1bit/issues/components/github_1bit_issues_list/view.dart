import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import '../github_issues/view.dart';
import 'logic.dart';

class Github1bitIssuesListComponent extends StatelessWidget {
  const Github1bitIssuesListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Github1bitIssuesListLogic());
    final state = Get.find<Github1bitIssuesListLogic>().state;

    return PagingWidgetBuilder.buildRefresher(
      logic,
      builder: (controller) {
        return ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () => QKit.route.to(rt_toolGithubIssuesDetail, argument: state.dataList[index]),
            child: GithubIssuesWidget(issues: state.dataList[index]),
          ),
          itemCount: state.dataList.length,
          physics: BouncingScrollPhysics(),
          addAutomaticKeepAlives: true,
        );
      },
    );
  }
}
