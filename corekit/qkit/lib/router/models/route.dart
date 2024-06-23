import 'package:get/get.dart';

/// 路由对象
class QRoute {
  String routeName;
  GetPageBuilder pageBuilder;
  Bindings? binding;
  List<Bindings> bindings;
  Transition? transition;
  Duration? transitionDuration;
  CustomTransition? customTransition;
  List<GetMiddleware>? middlewares;

  QRoute(
    this.routeName,
    this.pageBuilder, {
    this.binding,
    this.bindings = const [],
    this.transition,
    this.transitionDuration,
    this.customTransition,
    this.middlewares,
  });
}
