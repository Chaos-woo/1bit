import 'package:cw2bit/modules/app_hot_search/values/constant.dart';

class AppReadingThresholdConfigState {
  List<AppReadingThresholdConfig> threshold_configs = [];

  AppReadingThresholdConfigState() {}
}

/// APP阈值展示组件配置
class AppReadingThresholdConfig {
  final ReadingProgressThreshold threshold;
  final bool should_show_config;
  final int in_advance_threshold;

  AppReadingThresholdConfig(
      {required this.threshold, required this.should_show_config, required this.in_advance_threshold});
}
