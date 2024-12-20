import 'package:cached_network_image/cached_network_image.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';

class UiAppBar {
  /// 定制化的Bing每日壁纸AppBar
  Widget bing_image_appbar_flexible_space({
    String title = '',
    IconData? icon,
    bool center_title = true,
  }) {
    return FutureBuilder(
        future: c0_.mgr_bing.get_bing_daily_image(),
        builder: (b_context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null || snapshot.data == '') {
              return FlexibleSpaceBar(
                centerTitle: center_title,
                titlePadding: EdgeInsetsDirectional.fromSTEB(center_title ? 0 : 64, 0, 0, 14),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Icon(
                          icon,
                          color: Colors.black,
                          size: 22,
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.zero,
                      child: Text(
                        title,
                        style: FlutterFlowTheme.of(b_context).headlineMedium.override(
                              color: Colors.black,
                              fontSize: 22,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return FlexibleSpaceBar(
              centerTitle: center_title,
              titlePadding: EdgeInsetsDirectional.fromSTEB(center_title ? 0 : 64, 0, 0, 14),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.zero,
                    child: Text(
                      title,
                      style: FlutterFlowTheme.of(b_context).headlineMedium.override(
                            color: Colors.white,
                            fontSize: 22,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.1),
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data!,
                    imageBuilder: (b_context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.85), BlendMode.dstATop)),
                      ),
                    ),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          } else {
            return FlexibleSpaceBar(
              centerTitle: center_title,
              titlePadding: EdgeInsetsDirectional.fromSTEB(center_title ? 0 : 64, 0, 0, 14),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                      child: Icon(
                        icon,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.zero,
                    child: Text(
                      title,
                      style: FlutterFlowTheme.of(b_context).headlineMedium.override(
                            color: Colors.black,
                            fontSize: 22,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
