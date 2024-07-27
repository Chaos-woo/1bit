import 'package:cw2bit/domain/tool/github_1bit/issues/values/constant.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class Github1bitIssuesEditPage extends StatelessWidget {
  const Github1bitIssuesEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Github1bitIssuesEditLogic());
    final state = Get.find<Github1bitIssuesEditLogic>().state;

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            QKit.route.back(backValue: GithubApiDataPostAction.noActionThenBack);
          },
        ),
        title: Text(
          '编辑 1bit issues',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Text(
                          '# 标签',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SelectedIssuesLabelChoice(key: logic.labelChoiceKey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                child: TextFormField(
                  controller: logic.titleTextEditingController,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: '标题',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                  maxLines: 2,
                  minLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                child: TextFormField(
                  controller: logic.bodyTextEditingController,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: '内容',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                  maxLines: 20,
                  minLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                child: Text(
                  '快速创建模板',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          logic.useContentTemplateByIssuesLabel(IssuesLabelTemplate.bug);
                        },
                        text: 'Bug模板',
                        options: FFButtonOptions(
                          height: 30,
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFFD73A4A),
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                                fontWeight: FontWeight.w300,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          elevation: 0,
                        ),
                        showLoadingIndicator: false,
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          logic.useContentTemplateByIssuesLabel(IssuesLabelTemplate.feature);
                        },
                        text: 'Feature模板',
                        options: FFButtonOptions(
                          height: 30,
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFF0075CA),
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                                fontWeight: FontWeight.w300,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          elevation: 0,
                        ),
                        showLoadingIndicator: false,
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          logic.useContentTemplateByIssuesLabel(IssuesLabelTemplate.enhance);
                        },
                        text: 'Enhance模板',
                        options: FFButtonOptions(
                          height: 30,
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFF8FD5D6),
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                                fontWeight: FontWeight.w300,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        showLoadingIndicator: false,
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          logic.useContentTemplateByIssuesLabel(IssuesLabelTemplate.question);
                        },
                        text: 'Question模板',
                        options: FFButtonOptions(
                          height: 30,
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFFD876E3),
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                                fontWeight: FontWeight.w300,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ].divide(SizedBox(width: 10)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                var postResult = await logic.post();
                                if (postResult) {
                                  Bit1Ui.showSimpleSnackBar('提交成功');
                                  QKit.route
                                      .back(backValue: GithubApiDataPostAction.postedDataThenBack);
                                } else {
                                  Bit1Ui.showSimpleSnackBar('提交失败');
                                }
                              },
                              text: '提交 Github',
                              options: FFButtonOptions(
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      letterSpacing: 0,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
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

class SelectedIssuesLabelChoice extends StatefulWidget {
  const SelectedIssuesLabelChoice({super.key});

  @override
  State<SelectedIssuesLabelChoice> createState() => SelectedIssuesLabelChoiceState();
}

class SelectedIssuesLabelChoiceState extends State<SelectedIssuesLabelChoice> {
  void refreshState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Github1bitIssuesEditLogic>();
    final state = Get.find<Github1bitIssuesEditLogic>().state;
    return (state.labelValues.isEmpty)
        ? Text(
            '正在获取标签...',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0,
                ),
          )
        : FlutterFlowChoiceChips(
            options: state.labelValues.map((label) => ChipData(label.name)).toList(),
            onChanged: (val) {
              logic.updateSelectedLabels(val);
            },
            selectedChipStyle: ChipStyle(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0,
                  ),
              iconColor: FlutterFlowTheme.of(context).primaryText,
              iconSize: 18,
              elevation: 0,
              borderRadius: BorderRadius.circular(10),
            ),
            unselectedChipStyle: ChipStyle(
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12,
                    letterSpacing: 0,
                  ),
              iconColor: FlutterFlowTheme.of(context).secondaryText,
              iconSize: 18,
              elevation: 0,
              borderRadius: BorderRadius.circular(10),
            ),
            chipSpacing: 5,
            rowSpacing: 12,
            multiselect: true,
            alignment: WrapAlignment.start,
            controller: FormFieldController<List<String>>(state.choiceChipLabelInitVal),
          );
  }
}
