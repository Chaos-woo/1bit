import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import '../github_issues/view.dart';
import 'logic.dart';

class Github1bitIssuesListComponent extends StatelessWidget {
  const Github1bitIssuesListComponent({
    Key? key,
    OnRefreshedListener? onRefreshedListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Github1bitIssuesListLogic>();
    final state = Get.find<Github1bitIssuesListLogic>().state;

    return PagingWidgetBuilder.build_refresher(
      logic,
      builder: (controller) {
        return ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () => q0_.route.to(rout0_.tool_github_issues_detail, argument: state.data_list[index]),
            child: GithubIssuesWidget(issues: state.data_list[index]),
          ),
          itemCount: state.data_list.length,
          physics: BouncingScrollPhysics(),
          addAutomaticKeepAlives: true,
        );
      },
    );
  }
}
