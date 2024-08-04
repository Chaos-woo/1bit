import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WallabagHomepagePage extends StatelessWidget {
  const WallabagHomepagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WallabagHomepageLogic());
    final state = Get.find<WallabagHomepageLogic>().state;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 320,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 8, 4, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Icon(
                            Icons.settings_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 28,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Icon(
                            Icons.switch_left_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 28,
                          ),
                        ),
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Icon(
                              Icons.find_in_page_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 28,
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Icon(
                            Icons.archive_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 28,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 28,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Icon(
                            Icons.restart_alt_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 28,
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 15))
                          .addToStart(SizedBox(height: 5))
                          .addToEnd(SizedBox(height: 5)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: Colors.red,
                            ),
                            child: ExpandableNotifier(
                              controller: logic.expandableExpandableController,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '可筛选域名',
                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                              letterSpacing: 0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).tertiary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(3),
                                              child: Text(
                                                '12',
                                                style: FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontSize: 12,
                                                      letterSpacing: 0,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                collapsed: Container(),
                                expanded: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      FlutterFlowChoiceChips(
                                        options: [ChipData('domain1', Icons.domain_rounded)],
                                        onChanged: (val) => {},
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                          textStyle:
                                              FlutterFlowTheme.of(context).bodyMedium.override(
                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                    letterSpacing: 0,
                                                  ),
                                          iconColor: FlutterFlowTheme.of(context).primaryText,
                                          iconSize: 16,
                                          elevation: 0,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                fontSize: 12,
                                                letterSpacing: 0,
                                              ),
                                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                                          iconSize: 16,
                                          elevation: 0,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        chipSpacing: 5,
                                        rowSpacing: 5,
                                        multiselect: true,
                                        alignment: WrapAlignment.start,
                                        controller: logic.choiceChipsDomainValueController ??=
                                            FormFieldController<List<String>>(
                                          [],
                                        ),
                                        wrapped: true,
                                      ),
                                    ].divide(SizedBox(height: 5)),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              30,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Text('A'),
                              Text('A'),
                              Text('A'),
                              Text('A'),
                              Text('A'),
                              Text('A'),
                            ].divide(SizedBox(height: 10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
