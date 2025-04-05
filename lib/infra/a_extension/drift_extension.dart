import 'package:drift/drift.dart';

extension StringDriftExtension on String {
  Value<String> get driftVal => Value(this);
}

extension DatetimeDriftExtension on DateTime {
  Value<DateTime> get driftVal => Value(this);
}

extension IntDriftExtension on int {
  Value<int> get driftVal => Value(this);
}

extension DoubleDriftExtension on double {
  Value<double> get driftVal => Value(this);
}

extension BoolDriftExtension on bool {
  Value<bool> get driftVal => Value(this);
}
