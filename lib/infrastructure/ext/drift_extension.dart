import 'package:drift/drift.dart';

extension StringDriftExtension on String {
  Value<String> get drift_value => Value(this);
}

extension DatetimeDriftExtension on DateTime {
  Value<DateTime> get drift_value => Value(this);
}

extension IntDriftExtension on int {
  Value<int> get drift_value => Value(this);
}

extension DoubleDriftExtension on double {
  Value<double> get drift_value => Value(this);
}

extension boolDriftExtension on bool {
  Value<bool> get drift_value => Value(this);
}
