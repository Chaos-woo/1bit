
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class CustomSampleCompWidget extends StatelessWidget {
  const CustomSampleCompWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.notifications_none,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 72,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Text(
                'No Activity',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
              child: Text(
                'It seems that you don\'t have any recent activity.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
