import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr_scan_text/ocr_scan/model/recognizer_text/text_block.dart' as ocr;
import 'package:ocr_scan_text/ocr_scan/model/scan_result.dart';
import 'package:ocr_scan_text/ocr_scan/module/scan_module.dart';

import 'state.dart';

class TextOcrLogic extends GetxController {
  final TextOcrState state = TextOcrState();

  final String k_ocrCameraViewId = '#liveScanWidget';

  /// 文本框控制器
  TextEditingController? textController;

  /// 是否更新OCR结果文本框
  bool _updateOcrView = true;

  /// OCR识别处理模块
  late ScanModule ocrModule;

  /// google-ML三方库语言识别参数
  TextRecognizer usedTextRecognizer = TextRecognizer(script: TextRecognitionScript.chinese);

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
    ocrModule = ScanAllModule();
  }

  @override
  void dispose() {
    super.dispose();
    textController?.dispose();
  }

  void updateScanOcrView(String text) {
    if (_updateOcrView) {
      textController?.text = text;
    }
  }

  void stopScanUpdateOcrView() {
    ocrModule.stop();
    _updateOcrView = false;
    state.ocrText = textController!.text;
    update([k_ocrCameraViewId]);
  }

  void startScanUpdateOcrView() {
    ocrModule.start();
    _updateOcrView = true;
    state.ocrText = '';
    update([k_ocrCameraViewId]);
  }
}

class ScanAllModule extends ScanModule {
  ScanAllModule()
      : super(
          label: '',
          color: Colors.redAccent.withOpacity(0.3),
          validateCountCorrelation: 1,
        );

  @override
  Future<List<ScanResult>> matchedResult(
    List<ocr.TextBlock> textBlock,
    String text,
  ) async {
    List<ScanResult> list = [];
    for (var block in textBlock) {
      for (var line in block.lines) {
        for (var element in line.elements) {
          list.add(
            ScanResult(
              cleanedText: element.text,
              scannedElementList: [element],
            ),
          );
        }
      }
    }
    return list;
  }
}
