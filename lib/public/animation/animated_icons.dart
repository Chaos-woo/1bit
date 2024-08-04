import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:qkit/qkit.dart';

class ToggleableAnimatedIcon extends HookWidget {
  final String icons8;
  final Function()? on_tap;
  final Function()? on_restore;
  final double? icon_size;
  final Duration? duration;
  final Duration? reverse_duration;

  ToggleableAnimatedIcon(
    this.icons8, {
    Key? key,
    this.on_tap,
    this.on_restore,
    this.icon_size,
    this.duration,
    this.reverse_duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration forward_duration = duration ?? 1000.milliseconds;
    Duration reverse_duration = this.reverse_duration ?? forward_duration;

    var controller = useAnimationController(
      duration: forward_duration,
      reverseDuration: reverse_duration,
    );

    return SizedBox(
      child: IconButton(
        splashRadius: 50,
        iconSize: icon_size ?? 24.0,
        onPressed: () {
          if (controller.status == AnimationStatus.dismissed) {
            controller.reset();
            controller.animateTo(0.6);
            on_tap?.call();
          } else {
            controller.reverse();
            on_restore?.call();
          }
        },
        icon: Lottie.asset(icons8, controller: controller),
      ),
    );
  }
}

class RepeatableAnimatedIcon extends HookWidget {
  /// https://xvrh.github.io/lottie-flutter-web/#/
  final String lottie_file;
  final Function()? on_tap;
  final Function()? on_stop;
  final double? icon_size;
  final Duration? duration;
  final Duration? reverse_duration;

  RepeatableAnimatedIcon(
    this.lottie_file, {
    Key? key,
    this.on_tap,
    this.on_stop,
    this.icon_size,
    this.duration,
    this.reverse_duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration forward_duration = duration ?? 3000.milliseconds;
    Duration reverse_duration = this.reverse_duration ?? forward_duration;

    var controller = useAnimationController(
      duration: forward_duration,
      reverseDuration: reverse_duration,
    );

    return SizedBox(
      width: icon_size ?? 24.0,
      height: icon_size ?? 24.0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OverflowBox(
            minWidth: constraints.maxWidth * 4,
            maxWidth: constraints.maxWidth * 4,
            minHeight: constraints.maxHeight * 4,
            maxHeight: constraints.maxHeight * 4,
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              child: Lottie.asset(lottie_file, controller: controller, fit: BoxFit.cover),
              onTap: () {
                if (controller.isAnimating) {
                  controller.reset();
                  on_stop?.call();
                } else {
                  controller.repeat();
                  on_tap?.call();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
