import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolGroup {
  /// 工具组名
  final String name;

  /// 工具项
  final List<ToolGroupItem> items;

  /// 排序
  int order;

  ToolGroup({
    required this.name,
    required this.items,
    this.order = 0,
  });
}

enum ToolGroupItemType {
  /// 普通展示
  display,

  /// 可路由跳转
  router,

  /// 开关类型
  switcher
}

class ToolGroupItem {
  /// 工具项标题
  final String title;

  /// 工具项子标题
  final String subtitle;

  /// 工具项类型
  final ToolGroupItemType type;

  /// 工具项图标
  final Icon? icon;

  ToolGroupItem({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.icon,
  });
}

class ToolGroupItemRouter extends ToolGroupItem {
  /// 跳转函数
  final Function? onTap;

  ToolGroupItemRouter({
    required super.title,
    required super.subtitle,
    required super.type,
    required super.icon,
    required this.onTap,
  });
}

class ToolGroupItemSwitcher extends ToolGroupItem {
  /// 初始值
  final bool initialValue;

  /// 变化值
  late var value = false.obs;
  /// 变化函数
  Function(RxBool)? onChanged;

  ToolGroupItemSwitcher({
    required super.title,
    required super.subtitle,
    required super.type,
    required super.icon,
    required this.initialValue,
    this.onChanged,
  }) {
    value.value = initialValue;
  }
}
