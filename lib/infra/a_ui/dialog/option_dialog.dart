import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_sdk_bridge/text_util_extension.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

class INKOptionDialog {
  Future<void> show(
    String title,
    List<DialogOption> options, {
    bool multipleChoice = false,
    String? subtitle,
    BuildContext? buildContext,
    Function(Map<String, bool>)? onConfirm,
    Function()? onCancel,
  }) async {
    var context = buildContext ?? Get.context!;
    var showOptions = multipleChoice ? options : [options[0]];

    var optionSelection =
        <String, bool>{for (var option in showOptions) option.index: option.initialValue ?? false}.obs;

    if (optionSelection.values.length != showOptions.length) {
      throw Exception('DialogOption.index must be unique');
    }

    await showDialog(
        barrierColor: INKs.color.barrierColor,
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 530,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x33000000),
                      offset: Offset(
                        0,
                        1,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            if (INKs.sdk.text.isNotEmpty(subtitle))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Text(
                                  subtitle!,
                                  maxLines: 4,
                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Obx(() {
                        return ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            for (var option in showOptions)
                              _buildOption(option, optionSelection[option.index]!, context, (newValue) {
                                var newOptionSelection = <String, bool>{
                                  for (var entry in optionSelection.entries)
                                    entry.key: entry.key == option.index ? newValue : entry.value
                                };
                                optionSelection.value = {
                                  for (var entry in newOptionSelection.entries) entry.key: entry.value
                                };
                              }),
                          ],
                        );
                      }),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  onCancel?.call();
                                  INKs.router.back();
                                },
                                text: '取消',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                onConfirm?.call(
                                  {for (var entry in optionSelection.entries) entry.key: entry.value},
                                );
                                INKs.router.back();
                              },
                              text: '确认',
                              options: FFButtonOptions(
                                height: 40,
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildOption(DialogOption option, bool selected, BuildContext context, Function(bool) onClick) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 1),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: FlutterFlowTheme.of(context).primaryBackground,
              offset: Offset(
                0,
                1,
              ),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Icon(
                  option.icon,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option.title,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              letterSpacing: 0.0,
                            ),
                      ),
                      if (INKs.sdk.text.isNotEmpty(option.subtitle))
                        Text(
                          option.subtitle!,
                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                letterSpacing: 0.0,
                              ),
                        ),
                    ],
                  ),
                ),
              ),
              Theme(
                data: ThemeData(
                  checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryText,
                ),
                child: Checkbox(
                  value: selected,
                  onChanged: (newValue) async {
                    onClick.call(newValue!);
                  },
                  side: BorderSide(
                    width: 2,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  activeColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 弹窗可选项定义
class DialogOption {
  final String index;
  final String title;
  final String? subtitle;
  final IconData? icon;
  bool? initialValue;

  DialogOption({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
