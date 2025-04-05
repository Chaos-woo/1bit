import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_sdk_bridge/text_util_extension.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

class INKSingleInputDialog {
  Future<void> show(
    String title, {
    String? initialValue,
    String? subtitle,
    String? hintText,
    String? labelText,
    BuildContext? buildContext,
    Function(String)? onConfirm,
    Function()? onCancel,
    int maxLength = 500,
  }) async {
    var controller = TextEditingController(text: initialValue);
    var context = buildContext ?? Get.context!;

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
                                  maxLines: 3,
                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: controller,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: labelText,
                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: hintText,
                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBDBDB),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).error,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).error,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    suffixIcon: controller.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              controller.clear();
                                            },
                                            child: Icon(Icons.clear, size: 22),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 5,
                                  minLines: 1,
                                  maxLength: maxLength,
                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                onConfirm?.call(controller.text);
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
}
