import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_1bit_issues_list/view.dart';
import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class Github1bitIssuesPage extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var drawerKey = GlobalKey<IssuesFilteredDrawerWidgetState>();

  Github1bitIssuesPage({Key? key}) : super(key: key) {
    Get.find<Github1bitIssuesLogic>().drawerKey = drawerKey;
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Github1bitIssuesLogic>();
    final state = Get.find<Github1bitIssuesLogic>().state;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GithubApiDataPostAction back_action =
              await QKit.route.to(rt_toolGithubIssuesEdit) as GithubApiDataPostAction;
          if (back_action == GithubApiDataPostAction.posted_data_then_back) {
            logic.mark_refresh_list();
            logic.refreshIssuesListByNewFiltered(isDrawerOpened: false);
          }
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.of(context).info,
          size: 24,
        ),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: IssuesFilteredDrawerWidget(
        key: drawerKey,
        scaffoldKey: scaffoldKey,
      ),
      onDrawerChanged: ((isOpened) =>
          logic.refreshIssuesListByNewFiltered(isDrawerOpened: isOpened)),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            QKit.route.back();
          },
        ),
        title: Text(
          '1bit Github Issues',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 0,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              fillColor: FlutterFlowTheme.of(context).accent1,
              icon: Icon(
                Icons.settings_rounded,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () async {
                QKit.route.to(rt_tool_github_setting);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        text: '过滤器',
                        icon: Icon(
                          Icons.filter_alt_rounded,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 30,
                          padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 8,
                                letterSpacing: 0,
                                lineHeight: 1,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        showLoadingIndicator: false,
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: GetBuilder<Github1bitIssuesLogic>(
                          id: logic.k_selectedChoiceRowViewId,
                          builder: (Github1bitIssuesLogic controller) {
                            List<String> selectedChoice = logic.getAllSelectedChoice();
                            int expectedWidgetCnt = selectedChoice.length * 2 - 1;
                            return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    for (int i = 1; i < expectedWidgetCnt + 1; i++)
                                      i % 2 == 1
                                          ? Text(
                                              selectedChoice[(i / 2).floor()],
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    color:
                                                        FlutterFlowTheme.of(context).secondaryText,
                                                    letterSpacing: 0,
                                                  ),
                                            )
                                          : SizedBox(
                                              height: 15,
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: FlutterFlowTheme.of(context).secondaryText,
                                              ),
                                            )
                                  ],
                                ));
                          },
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                child: Text(
                  '问题列表',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        letterSpacing: 0,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GetBuilder<Github1bitIssuesLogic>(
                  id: logic.k_issuesListViewId,
                  builder: (Github1bitIssuesLogic controller) {
                    return Github1bitIssuesListComponent();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IssuesFilteredDrawerWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  IssuesFilteredDrawerWidget({super.key, required this.scaffoldKey});

  @override
  State<IssuesFilteredDrawerWidget> createState() => IssuesFilteredDrawerWidgetState();
}

class IssuesFilteredDrawerWidgetState extends State<IssuesFilteredDrawerWidget> {
  void refresh_state() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Github1bitIssuesLogic>();
    final state = Get.find<Github1bitIssuesLogic>().state;

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: Drawer(
        elevation: 16,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              '过滤器',
                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                    fontSize: 18,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              '(不选择则使用默认过滤器)',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    letterSpacing: 0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            '问题状态',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: FlutterFlowChoiceChips(
                            options: state.stateValues
                                .map((filtered) => ChipData(filtered.label))
                                .toList(),
                            onChanged: (val) {
                              logic.choiceChipsStateValue = val?.firstOrNull;
                            },
                            selectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    letterSpacing: 0,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).primaryText,
                              iconSize: 18,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    letterSpacing: 0,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            chipSpacing: 12,
                            rowSpacing: 12,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                            controller:
                                FormFieldController<List<String>>(state.choiceChipStateInitVal),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            '1bit issues 标签',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: (state.label_values.isEmpty)
                              ? Text(
                                  '正在获取标签...',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        letterSpacing: 0,
                                      ),
                                )
                              : FlutterFlowChoiceChips(
                                  options: state.label_values
                                      .map((label) => ChipData(label.name))
                                      .toList(),
                                  onChanged: (val) => logic.choiceChipsLabelValue = val,
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          letterSpacing: 0,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context).primaryText,
                                    iconSize: 18,
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          letterSpacing: 0,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                                    iconSize: 18,
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  chipSpacing: 12,
                                  rowSpacing: 12,
                                  multiselect: true,
                                  alignment: WrapAlignment.start,
                                  controller: FormFieldController<List<String>>(
                                      state.choiceChipLabelInitVal)),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            '可排序字段',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: FlutterFlowChoiceChips(
                            options: state.sortFieldsValues
                                .map((filtered) => ChipData(filtered.label))
                                .toList(),
                            onChanged: (val) => logic.choiceChipsSortFieldsValue = val?.firstOrNull,
                            selectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    letterSpacing: 0,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).primaryText,
                              iconSize: 18,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    letterSpacing: 0,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            chipSpacing: 12,
                            rowSpacing: 12,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                            controller: FormFieldController<List<String>>(
                                state.choiceChipSortFieldsInitVal),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            '排序方向',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: FlutterFlowChoiceChips(
                            options: state.sortDirectionValues
                                .map((filtered) => ChipData(filtered.label))
                                .toList(),
                            onChanged: (val) =>
                                logic.choiceChipsSortDirectionValue = val?.firstOrNull,
                            selectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    letterSpacing: 0,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).primaryText,
                              iconSize: 18,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    letterSpacing: 0,
                                  ),
                              iconColor: FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            chipSpacing: 12,
                            rowSpacing: 12,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                            controller: FormFieldController<List<String>>(
                                state.choiceChipSortDirectionInitVal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (widget.scaffoldKey.currentState!.isDrawerOpen ||
                                    widget.scaffoldKey.currentState!.isEndDrawerOpen) {
                                  logic.clearAllFilteredChoice();
                                  widget.scaffoldKey.currentState!.closeDrawer();
                                }
                              },
                              text: '移除全部过滤器',
                              options: FFButtonOptions(
                                height: 35,
                                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      letterSpacing: 0,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (widget.scaffoldKey.currentState!.isDrawerOpen ||
                                    widget.scaffoldKey.currentState!.isEndDrawerOpen) {
                                  logic.updateSelectedChoice();
                                  widget.scaffoldKey.currentState!.closeDrawer();
                                }
                              },
                              text: '确定',
                              options: FFButtonOptions(
                                height: 35,
                                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      color: Colors.white,
                                      letterSpacing: 0,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
