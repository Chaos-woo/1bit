import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

import 'state.dart';

class Github1bitIssuesLogic extends GetxController {
  final Github1bitIssuesState state = Github1bitIssuesState();

  FormFieldController<List<String>>? choiceChipsButLevelValueController;

  List<String>? get choiceChipsButLevelValues => choiceChipsButLevelValueController?.value;

  set choiceChipsButLevelValues(List<String>? val) =>
      choiceChipsButLevelValueController?.value = val;
}
