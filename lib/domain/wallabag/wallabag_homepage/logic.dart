import 'package:expandable/expandable.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

import 'state.dart';

class WallabagHomepageLogic extends GetxController {
  final WallabagHomepageState state = WallabagHomepageState();

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController = ExpandableController();

  // State field(s) for ChoiceChips_domain widget.
  FormFieldController<List<String>>? choiceChipsDomainValueController = FormFieldController(['A']);

  List<String>? get choiceChipsDomainValues => choiceChipsDomainValueController?.value;

  set choiceChipsDomainValues(List<String>? val) => choiceChipsDomainValueController?.value = val;
}
