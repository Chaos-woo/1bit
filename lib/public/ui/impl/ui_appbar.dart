import 'package:cached_network_image/cached_network_image.dart';
import 'package:cw2bit/domain/bing/service/bing_mgr.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:flutter/material.dart';

class UiAppBar {
  /// 定制化的Bing每日壁纸AppBar
  Widget bing_image_appbar_flexible_space({String title = '', IconData? icon}) {
    return FutureBuilder(
        future: BingMgr.singl.get_bing_daily_image(),
        builder: (b_context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null || snapshot.data == '') {
              return FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      color: Colors.white,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (icon != null)
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 16),
                                child: Icon(
                                  icon,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Text(
                                title,
                                style: FlutterFlowTheme.of(b_context).headlineMedium.override(
                                      color: Colors.black,
                                      fontSize: 22,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return FlexibleSpaceBar(
              background: Stack(
                children: [
                  ClipRRect(
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
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 16),
                              child: Icon(
                                icon,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Text(
                              title,
                              style: FlutterFlowTheme.of(b_context).headlineMedium.override(
                                    color: Colors.white,
                                    fontSize: 22,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 18),
                              child: Icon(
                                icon,
                                color: Colors.black,
                                size: 22,
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                            child: Text(
                              title,
                              style: FlutterFlowTheme.of(b_context).headlineMedium.override(
                                    color: Colors.black,
                                    fontSize: 22,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
