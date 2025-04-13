import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class AnimatedOnOffSwitcher extends StatefulWidget {
  final AnimatedOnOffState initialState;
  Function(AnimatedOnOffState)? onChanged;

  AnimatedOnOffSwitcher({super.key, required this.initialState, this.onChanged});

  @override
  State<AnimatedOnOffSwitcher> createState() => _AnimatedOnOffSwitcherState();
}

class _AnimatedOnOffSwitcherState extends State<AnimatedOnOffSwitcher> with TickerProviderStateMixin {
  late AnimatedOnOffState state;
  final animations = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    state = widget.initialState;

    animations.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animations.values.where((anim) => anim.trigger == AnimationTrigger.onActionTrigger || !anim.applyInitialState),
      this,
    );
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (AnimatedOnOffState.on == state) {
          if (animations['containerOnActionTriggerAnimation'] != null) {
            animations['containerOnActionTriggerAnimation']!.controller.forward(from: 0.0);
          }
        } else {
          if (animations['containerOnActionTriggerAnimation'] != null) {
            animations['containerOnActionTriggerAnimation']!.controller.reverse();
          }
        }
      },
      child: Container(
        width: 45,
        height: 25,
        decoration: BoxDecoration(
          color: Color(0xFFF1F4F8),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xFFE0E3E7),
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Stack(
            alignment: AlignmentDirectional(0, 0),
            children: [
              Align(
                alignment: AlignmentDirectional(1, 0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.rectangle,
                  ),
                ).animateOnActionTrigger(
                  animations['containerOnActionTriggerAnimation']!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

sealed class AnimatedOnOffState {
  const AnimatedOnOffState();

  static const on = AnimatedOnOffStateOn();
  static const off = AnimatedOnOffStateOff();

  static AnimatedOnOffState fromBoolean(bool value) {
    return value ? on : off;
  }

  bool get isOn => this == on;

  bool get isOff => this == off;
}

class AnimatedOnOffStateOn extends AnimatedOnOffState {
  const AnimatedOnOffStateOn();
}

class AnimatedOnOffStateOff extends AnimatedOnOffState {
  const AnimatedOnOffStateOff();
}
