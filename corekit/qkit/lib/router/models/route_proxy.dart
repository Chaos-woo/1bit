import 'package:get/get.dart';

/// 路由对象
class RouteProxy {
  String route_name;
  GetPageBuilder page_builder;
  Bindings? binding;
  List<Bindings> bindings;
  Transition? transition;
  Duration? transition_duration;
  CustomTransition? override_transition;
  List<GetMiddleware>? middlewares;

  RouteProxy(
    this.route_name,
    this.page_builder, {
    this.binding,
    this.bindings = const [],
    this.transition,
    this.transition_duration,
    this.override_transition,
    this.middlewares,
  });
}
