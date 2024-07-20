import 'dart:async';
import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr_scan_text/ocr_scan/module/scan_module.dart';
import 'package:ocr_scan_text/ocr_scan/services/ocr_scan_service.dart';


class MyScanWidget extends StatefulWidget {
  /// Respect the ratio of the camera for the display of the preview
  final bool respectRatio;

  /// List of research modules
  final List<ScanModule> scanModules;

  /// Callback method returning the results found and validated
  final Function(OcrTextRecognizerResult ocrTextResult) ocrTextResult;

  /// 支持的语言模块
  /// 自定义组件以支持中文
  final TextRecognizer? textRecognizer;

  const MyScanWidget({
    Key? key,
    required this.scanModules,
    required this.ocrTextResult,
    required this.respectRatio,
    this.textRecognizer,
  }) : super(key: key);

  @override
  MyScanWidgetState createState() => MyScanWidgetState();
}

class MyScanWidgetState<T extends MyScanWidget> extends State<T> {
  /// MLKit text detection object
  late TextRecognizer _textRecognizer;

  /// Processing an image already in progress
  bool _isBusy = false;

  /// Overlay on the image of the different areas of the results coming from the modules
  CustomPaint? customPaint;

  late OcrScanService _ocrScanService;

  @override
  void initState() {
    super.initState();
    _textRecognizer = widget.textRecognizer ?? TextRecognizer();
    _ocrScanService = OcrScanService(widget.scanModules);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /// Launch the search for results from the image for all the modules started
  Future<void> processImage(
      InputImage inputImage, Size imageSize, ui.Image? background) async {
    if (_isBusy) return;
    _isBusy = true;

    OcrTextRecognizerResult? result = await _ocrScanService.processImage(
      inputImage,
      imageSize,
      background,
      Mode.camera,
      widget.scanModules,
      _textRecognizer,
    );

    if (result != null && result.mapResult.isNotEmpty) {
      widget.ocrTextResult(result);
      customPaint = result.customPaint;
    }

    _isBusy = false;
    await _textRecognizer.close();
    if (mounted) {
      setState(() {});
    }
  }
}
