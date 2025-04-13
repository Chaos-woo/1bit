import 'package:cw2bit/modules/feature_explore/github_1bit/issues/components/github_1bit_issues_list/view.dart';
import 'package:cw2bit/modules/feature_explore/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/router/RTs.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class Github1bitIssuesPage extends StatelessWidget {
  final glob_k_scaffold_key = GlobalKey<ScaffoldState>();
  final glob_k_drawer_key = GlobalKey<IssuesFilteredDrawerWidgetState>();

  Github1bitIssuesPage({Key? key}) : super(key: key) {
    Get.find<Github1bitIssuesLogic>().drawer_key = glob_k_drawer_key;
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Github1bitIssuesLogic>();
    final state = Get.find<Github1bitIssuesLogic>().state;

    return Scaffold(
      key: glob_k_scaffold_key,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GithubApiDataPostAction back_action = await rout0_.github_issues_edit.to();
          if (back_action == GithubApiDataPostAction.posted_data_then_back) {
            logic.mark_refresh_list();
            logic.refresh_issues_list_by_new_filtered(is_drawer_opened: false);
          }
        },
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        elevation: 8,
        child: Icon(
          ui0_.icons.add,
          color: FlutterFlowTheme.of(context).info,
          size: 24,
        ),
      ),
      drawerEnableOpenDragGesture: false,
      drawer: IssuesFilteredDrawerWidget(
        key: glob_k_drawer_key,
        scaffold_key: glob_k_scaffold_key,
      ),
      onDrawerChanged: ((is_opened) => logic.refresh_issues_list_by_new_filtered(is_drawer_opened: is_opened)),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: '1ssues列表',
          icon: Icons.question_answer_outlined,
        ),
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            ui0_.icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            q0_.route.back();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              fillColor: Colors.transparent,
              icon: Icon(
                ui0_.icons.setting,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                rout0_.github_setting.to();
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
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
                          glob_k_scaffold_key.currentState!.openDrawer();
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
                          id: logic.k_selected_choice_row_view_id,
                          builder: (Github1bitIssuesLogic controller) {
                            var selected_choices = logic.get_all_selected_choices();
                            var expected_widget_cnt = selected_choices.length * 2 - 1;
                            return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    for (int i = 1; i < expected_widget_cnt + 1; i++)
                                      i % 2 == 1
                                          ? Text(
                                              selected_choices[(i / 2).floor()],
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    color: FlutterFlowTheme.of(context).secondaryText,
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
                child: Obx(
                  () => Text(
                    '问题列表(${state.m_total_issues_count})',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          letterSpacing: 0,
                        ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Github1bitIssuesListComponent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IssuesFilteredDrawerWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold_key;

  IssuesFilteredDrawerWidget({super.key, required this.scaffold_key});

  @override
  State<IssuesFilteredDrawerWidget> createState() => IssuesFilteredDrawerWidgetState();
}

class IssuesFilteredDrawerWidgetState extends State<IssuesFilteredDrawerWidget> {
  /// 提供外部刷新Drawer的方法
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
                            options: state.issues_state_values.map((filtered) => ChipData(filtered.label)).toList(),
                            onChanged: (val) {
                              logic.choice_chips_state_value = val?.firstOrNull;
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
                            controller: FormFieldController<List<String>>(state.choice_chip_state_init_val),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            'issues标签',
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
                                  options: state.label_values.map((label) => ChipData(label.name)).toList(),
                                  onChanged: (val) => logic.choice_chips_label_value = val,
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
                                  controller: FormFieldController<List<String>>(state.choice_chip_label_init_val)),
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
                            options: state.sortable_fields_values.map((filtered) => ChipData(filtered.label)).toList(),
                            onChanged: (val) => logic.choice_chips_sortable_fields_value = val?.firstOrNull,
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
                            controller: FormFieldController<List<String>>(state.choice_chip_sortable_fields_init_val),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            '排序顺序',
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
                            options: state.sort_direction_values.map((filtered) => ChipData(filtered.label)).toList(),
                            onChanged: (val) => logic.choice_chips_sort_direction_value = val?.firstOrNull,
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
                            controller: FormFieldController<List<String>>(state.choice_chip_sort_direction_init_val),
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
                                if (widget.scaffold_key.currentState!.isDrawerOpen ||
                                    widget.scaffold_key.currentState!.isEndDrawerOpen) {
                                  logic.clear_all_filtered_choice();
                                  widget.scaffold_key.currentState!.closeDrawer();
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
                                if (widget.scaffold_key.currentState!.isDrawerOpen ||
                                    widget.scaffold_key.currentState!.isEndDrawerOpen) {
                                  logic.update_selected_choice();
                                  widget.scaffold_key.currentState!.closeDrawer();
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
