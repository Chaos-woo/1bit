import 'package:get/get.dart';

/// 路由定义
class NamedRoute {
  String name;
  GetPageBuilder pageBuilder;
  Bindings? binding;
  List<Bindings> bindings;
  Transition? transition;
  Duration? transitionDuration;
  CustomTransition? overrideTransition;
  List<GetMiddleware>? middlewares;

  NamedRoute(
    this.name,
    this.pageBuilder, {
    this.binding,
    this.bindings = const [],
    this.transition,
    this.transitionDuration,
    this.overrideTransition,
    this.middlewares,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NamedRoute && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
