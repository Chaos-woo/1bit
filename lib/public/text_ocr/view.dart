import 'package:cw2bit/public/text_ocr/widgets/my_live_scan_widget.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class TextOcrPage extends StatelessWidget {
  const TextOcrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TextOcrLogic());
    final state = Get.find<TextOcrLogic>().state;

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
            QKit.route.back();
          },
        ),
        title: Text(
          'OCR-文字识别',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GetBuilder<TextOcrLogic>(
                        id: logic.k_ocrCameraViewId,
                        builder: (TextOcrLogic controller) {
                          return MyLiveScanWidget(
                            respectRatio: true,
                            textRecognizer: logic.usedTextRecognizer,
                            ocrTextResult: (ocrTextResult) {
                              var mapResult = ocrTextResult.mapResult.entries.firstOrNull;
                              if (null == mapResult) {
                                return;
                              }
                              String text = mapResult.value.map((e) => e.text).join('\n');
                              logic.updateScanOcrView(text);
                            },
                            scanModules: [logic.ocrModule],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Text(
                            '文字识别（扫描）结果：',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: logic.textController,
                            autofocus: false,
                            obscureText: false,
                            onChanged: (val) => state.ocrText = val,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                    letterSpacing: 0,
                                  ),
                              hintText: 'OCR文字识别（扫描）结果，示例：12345678',
                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
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
                                  letterSpacing: 0,
                                ),
                            maxLines: 4,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    QKit.route.back(backValue: logic.state.ocrText);
                                  },
                                  text: '确认',
                                  icon: Icon(
                                    Icons.edit_note_rounded,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    logic.stopScanUpdateOcrView();
                                  },
                                  text: '停止扫描',
                                  icon: Icon(
                                    Icons.content_paste_search_rounded,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    logic.startScanUpdateOcrView();
                                  },
                                  text: '开始扫描',
                                  icon: Icon(
                                    Icons.content_paste_search_rounded,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
