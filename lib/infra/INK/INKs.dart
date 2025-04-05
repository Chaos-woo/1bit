import 'package:cw2bit/infra/a_ddd/event_dispatcher.dart';
import 'package:cw2bit/infra/a_extension/directory.dart';
import 'package:cw2bit/infra/a_extension/index.dart';
import 'package:cw2bit/infra/a_extension/launcher.dart';
import 'package:cw2bit/infra/a_extension/permission.dart';
import 'package:cw2bit/infra/a_log/ink_log.dart';
import 'package:cw2bit/infra/a_router/router_bridge.dart';
import 'package:cw2bit/infra/a_sdk_bridge/index.dart';
import 'package:cw2bit/infra/a_ui/value/ui_color.dart';
import 'package:flutter/foundation.dart';

/// 基础设施统一管理库，
/// 避免长时间不用后遗忘
final class INKs {
  INKs._();

  /// 当前运行环境是否为Release环境
  static const bool isReleaseMode = kReleaseMode;

  static final INKSdk sdk = INKSdk();
  static final INKLog log = INKLog.singl;
  static final INKEventDispatcher events = INKEventDispatcher();
  static final INKStorageDirectory storageSpace = INKStorageDirectory();
  static final INKPermission permission = INKPermission();
  static final INKLauncher launcher = INKLauncher();
  static final INKRouter router = INKRouter();

  /// 小工具
  static final INKTool tool = INKTool();
  static final UiColor color = UiColor();
}
