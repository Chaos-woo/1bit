import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:flutter/material.dart';

class INKCircleButton extends StatelessWidget {
  double size;
  Function()? onTap;
  IconData icon;

  INKCircleButton({
    super.key,
    this.size = 40,
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
          shape: BoxShape.circle,
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
