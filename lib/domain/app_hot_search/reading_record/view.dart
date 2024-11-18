import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ReadingRecordPage extends StatelessWidget {
  ReadingRecordPage({Key? key}) : super(key: key);

  final logic = Get.put(ReadingRecordLogic());
  final state = Get.find<ReadingRecordLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
