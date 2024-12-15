import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class UiDialog {
  /// 展示带有输入框和提示信息的对话框
  Future<void> show_single_input_dialog({
    required String title,
    String? default_value,
    String? subtitle,
    String? hint_text,
    String? label_text,
    BuildContext? context,
    Function(String)? on_confirm,
    Function()? on_cancel,
    int max_length = 500,
  }) async {
    var controller = TextEditingController(text: default_value);
    var ctx = context ?? Get.context!;
    await showDialog(
      barrierColor: Color(0x80000000),
      context: ctx,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0, 0).resolve(Directionality.of(ctx)),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x9AFFFFFF),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 2, 16, 16),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 570,
                      maxHeight: 570,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Color(0x1E000000),
                          offset: Offset(
                            0,
                            5,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24, 16, 0, 0),
                            child: Text(
                              title,
                              style: FlutterFlowTheme.of(ctx).headlineMedium.override(
                                    color: Color(0xFF15161E),
                                    fontSize: 24,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                            child: subtitle != null
                                ? Text(
                                    subtitle,
                                    style: FlutterFlowTheme.of(ctx).labelMedium.override(
                                          color: Color(0xFF606A85),
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )
                                : Container(),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 32),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                  child: Container(
                                    child: TextFormField(
                                      controller: controller,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: label_text,
                                        labelStyle: FlutterFlowTheme.of(ctx).labelMedium.override(
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: hint_text,
                                        hintStyle: FlutterFlowTheme.of(ctx).labelMedium.override(
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(ctx).alternate,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(ctx).primary,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(ctx).error,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(ctx).error,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                      style: FlutterFlowTheme.of(ctx).bodyMedium.override(
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: null,
                                      maxLength: max_length == -1 ? null : max_length,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0.05),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              on_cancel?.call();
                                              Get.back();
                                            },
                                            text: '取消',
                                            options: FFButtonOptions(
                                              height: 30,
                                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                              color: Colors.white,
                                              textStyle: FlutterFlowTheme.of(ctx).bodyMedium.override(
                                                    color: Color(0xFF15161E),
                                                    fontSize: 14,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              elevation: 0,
                                              borderSide: BorderSide(
                                                color: Color(0xFFE5E7EB),
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(5),
                                              hoverColor: Color(0xFFE5E7EB),
                                              hoverBorderSide: BorderSide(
                                                color: Color(0xFFE5E7EB),
                                                width: 2,
                                              ),
                                              hoverTextColor: Color(0xFF15161E),
                                              hoverElevation: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0.05),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            on_confirm?.call(controller.text);
                                            Get.back();
                                          },
                                          text: '确认',
                                          options: FFButtonOptions(
                                            height: 30,
                                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                            color: FlutterFlowTheme.of(ctx).primary,
                                            textStyle: FlutterFlowTheme.of(ctx).titleSmall.override(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(5),
                                            hoverColor: Color(0x4D9489F5),
                                            hoverBorderSide: BorderSide(
                                              color: Color(0xFF6F61EF),
                                              width: 1,
                                            ),
                                            hoverTextColor: Color(0xFF15161E),
                                            hoverElevation: 0,
                                          ),
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          ),
        );
      },
    );
  }

  /// 展示带有确认和取消按钮的对话框
  Future<void> show_ok_cancel_dialog({
    required String title,
    String? message,
    String? confirm_text,
    String? cancel_text,
    BuildContext? context,
    Function()? on_confirm,
    Function()? on_cancel,
  }) async {
    var b_context = context ?? Get.context!;
    await showDialog(
      barrierColor: Color(0x80000000),
      context: b_context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0, 0).resolve(Directionality.of(b_context)),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x9AFFFFFF),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 2, 16, 16),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 570,
                      maxHeight: 570,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Color(0x1E000000),
                          offset: Offset(
                            0,
                            5,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24, 16, 0, 0),
                            child: Text(
                              title,
                              style: FlutterFlowTheme.of(b_context).headlineMedium.override(
                                    color: Color(0xFF15161E),
                                    fontSize: 24,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                            child: message != null
                                ? Text(
                                    message,
                                    style: FlutterFlowTheme.of(b_context).labelMedium.override(
                                          color: Color(0xFF606A85),
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )
                                : Container(),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24, 36, 24, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (on_cancel != null)
                                  Align(
                                    alignment: AlignmentDirectional(0, 0.05),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await on_cancel?.call();
                                          Get.back();
                                        },
                                        text: cancel_text ?? '取消',
                                        options: FFButtonOptions(
                                          height: 30,
                                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(b_context).bodyMedium.override(
                                                color: Color(0xFF15161E),
                                                fontSize: 14,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Color(0xFFE5E7EB),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                          hoverColor: Color(0xFFE5E7EB),
                                          hoverBorderSide: BorderSide(
                                            color: Color(0xFFE5E7EB),
                                            width: 2,
                                          ),
                                          hoverTextColor: Color(0xFF15161E),
                                          hoverElevation: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.05),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await on_confirm?.call();
                                      Get.back();
                                    },
                                    text: confirm_text ?? '确认',
                                    options: FFButtonOptions(
                                      height: 30,
                                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                      color: FlutterFlowTheme.of(b_context).primary,
                                      textStyle: FlutterFlowTheme.of(b_context).titleSmall.override(
                                            color: Colors.white,
                                            fontSize: 16,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      hoverColor: Color(0x4D9489F5),
                                      hoverBorderSide: BorderSide(
                                        color: Color(0xFF6F61EF),
                                        width: 1,
                                      ),
                                      hoverTextColor: Color(0xFF15161E),
                                      hoverElevation: 0,
                                    ),
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
              ],
            ),
          ),
        );
      },
    );
  }

  /// 展示带有取消和确认组件的自定义子组件弹窗
  Future<void> show_custom_dialog_with_ok_cancel_buttons({
    required String title,
    required List<Widget> children,
    BuildContext? context,
    String? confirm_text,
    String? cancel_text,
    Function()? on_confirm,
    Function()? on_cancel,
    barrier_dismissible = true,
  }) async {
    var b_context = context ?? Get.context!;
    await showDialog(
      barrierColor: Color(0x80000000),
      context: b_context,
      barrierDismissible: barrier_dismissible,
      builder: (_) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0, 0).resolve(Directionality.of(b_context)),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x9AFFFFFF),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 2, 16, 16),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      maxHeight: q0_.bridge.flustars.screen.screenHeightExt,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Color(0x1E000000),
                          offset: Offset(
                            0,
                            5,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(24, 16, 0, 0),
                            child: Text(
                              title,
                              style: FlutterFlowTheme.of(b_context).headlineMedium.override(
                                    color: Color(0xFF15161E),
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          ...children,
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (on_cancel != null)
                                        Align(
                                          alignment: AlignmentDirectional(0, 0.05),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                on_cancel?.call();
                                                Get.back();
                                              },
                                              text: cancel_text ?? '取消',
                                              options: FFButtonOptions(
                                                height: 30,
                                                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                color: Colors.white,
                                                textStyle: FlutterFlowTheme.of(b_context).bodyMedium.override(
                                                      color: Color(0xFF15161E),
                                                      fontSize: 14,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE5E7EB),
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.circular(4),
                                                hoverColor: Color(0xFFE5E7EB),
                                                hoverBorderSide: BorderSide(
                                                  color: Color(0xFFE5E7EB),
                                                  width: 2,
                                                ),
                                                hoverTextColor: Color(0xFF15161E),
                                                hoverElevation: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (on_confirm != null)
                                        Align(
                                          alignment: AlignmentDirectional(0, 0.05),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              on_confirm.call();
                                              Get.back();
                                            },
                                            text: confirm_text ?? '确认',
                                            options: FFButtonOptions(
                                              height: 30,
                                              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                              color: FlutterFlowTheme.of(b_context).primary,
                                              textStyle: FlutterFlowTheme.of(b_context).titleSmall.override(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              elevation: 0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(4),
                                              hoverColor: Color(0x4D9489F5),
                                              hoverBorderSide: BorderSide(
                                                color: Color(0xFF6F61EF),
                                                width: 1,
                                              ),
                                              hoverTextColor: Color(0xFF15161E),
                                              hoverElevation: 0,
                                            ),
                                          ),
                                        ),
                                    ],
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
              ],
            ),
          ),
        );
      },
    );
  }
}
