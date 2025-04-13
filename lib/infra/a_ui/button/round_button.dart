import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:flutter/material.dart';

class INKRoundButton extends StatelessWidget {
  double size;
  double radius;
  Function()? onTap;
  IconData icon;

  INKRoundButton({
    super.key,
    this.size = 40,
    this.radius = 8,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await onTap?.call();
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(radius),
          shape: BoxShape.rectangle,
        ),
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Icon(
                icon,
                color: FlutterFlowTheme.of(context).primaryText,
                size: size * 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
