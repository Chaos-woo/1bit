import 'package:cw2bit/modules/app_hot_search/reading_record/logic.dart';
import 'package:cw2bit/modules/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity_combination/comb_webpage_reading_sticker.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:qkit/qkit.dart';
import 'package:random_avatar/random_avatar.dart';

class HotSearchFavorite extends StatelessWidget {
  final Key list_view_key;

  const HotSearchFavorite({super.key, required this.list_view_key});

  @override
  Widget build(BuildContext context) {
    final logic = ReadingRecordLogic.getx;
    final state = logic.state;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
      child: state.favorite_webpages.isEmpty
          ? Center(
              child: Text('暂无 "收藏" 的记录噢~',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        color: FlutterFlowTheme.of(context).secondaryText,
                      )),
            )
          : SingleChildScrollView(
              key: list_view_key,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  for (final comb_webpage in state.favorite_webpages)
                    if (comb_webpage.webpage_reading.reading_progress >=
                        c0_.bis_mgr_hot_search_config
                            .get_app_archive_threshold_cache(comb_webpage.webpage_reading.app)
                            .as_double)
                      _widget_of_archive(context, comb_webpage)
                    else
                      _widget_of_reading(context, comb_webpage)
                ].divide(SizedBox(height: 8)).addToEnd(SizedBox(height: 8)),
              ),
            ),
    );
  }

  Widget _widget_of_reading(BuildContext context, CombWebpageReadingSticker comb_webpage) {
    final logic = ReadingRecordLogic.getx;

    var (be_read, remaining) = logic.format_app_progress_ratio(comb_webpage.webpage_reading);

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        /// 打开指定的网页webview
        await logic.open_hot_search_webview(comb_webpage.webpage_reading);
      },
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 150,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: RandomAvatar(
                        comb_webpage.webpage_reading.author ?? '未知',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comb_webpage.webpage_reading.author ?? '未知',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            q0_.bridge.flustars.date.format_date(
                              comb_webpage.webpage_reading.publish_time ?? comb_webpage.webpage_reading.create_time,
                              format: c_webpage_publish_date_time_format,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  fontSize: 10,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            /// 收藏或取消收藏
                            await logic.add_or_remove_favorite(comb_webpage.webpage_reading);
                          },
                          child: Icon(
                            comb_webpage.webpage_reading.is_collected ? Icons.star_rounded : Icons.star_border_rounded,
                            color: comb_webpage.webpage_reading.is_collected ? Color(0xFFF9E149) : Colors.grey,
                            size: 28,
                          ),
                        ),
                      ].divide(SizedBox(width: 10)),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: Text(
                      comb_webpage.webpage_reading.title ?? '暂无标题',
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontSize: 14,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            '阅读进度：',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Container(
                            width: 100,
                            constraints: BoxConstraints(
                              minHeight: 15,
                              maxHeight: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFFBFBFB),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: be_read,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x4D39D2C0),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: remaining,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFECECEC),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(4),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            '${be_read}%',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        /// TODO：打开文章分析页面
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              '文章分析：',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.analytics_rounded,
                            color:
                                q0_.bridge.flustars.functionality.isEmpty(comb_webpage.webpage_reading.article_analysis)
                                    ? Colors.grey
                                    : FlutterFlowTheme.of(context).tertiary,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (comb_webpage.generated_stickers.isNotEmpty)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 25,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (var sticker in comb_webpage.mix_stickers)
                              ui0_.sticker.small_sticker(sticker, on_tap: () async {}),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _widget_of_archive(BuildContext context, CombWebpageReadingSticker comb_webpage) {
    final logic = ReadingRecordLogic.getx;

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        /// 打开指定的网页webview
        await logic.open_hot_search_webview(comb_webpage.webpage_reading);
      },
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 150,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: RandomAvatar(
                        comb_webpage.webpage_reading.author ?? '未知',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comb_webpage.webpage_reading.author ?? '未知',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            q0_.bridge.flustars.date.format_date(
                              comb_webpage.webpage_reading.publish_time ?? comb_webpage.webpage_reading.create_time,
                              format: c_webpage_publish_date_time_format,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  fontSize: 10,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            /// 收藏或取消收藏
                            await logic.add_or_remove_favorite(comb_webpage.webpage_reading);
                          },
                          child: Icon(
                            comb_webpage.webpage_reading.is_collected ? Icons.star_rounded : Icons.star_border_rounded,
                            color: comb_webpage.webpage_reading.is_collected ? Color(0xFFF9E149) : Colors.grey,
                            size: 28,
                          ),
                        ),
                      ].divide(SizedBox(width: 10)),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: Text(
                      comb_webpage.webpage_reading.title ?? '暂无标题',
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontSize: 14,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          ui0_.icons.info,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 14,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            '首次阅读：${comb_webpage.webpage_reading.first_read_completed_time != null ? q0_.bridge.flustars.date.format_date(
                                comb_webpage.webpage_reading.first_read_completed_time,
                                format: c_webpage_publish_date_time_format,
                              ) : '未知'}',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          ui0_.icons.info,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 14,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            '阅读次数：${(comb_webpage.webpage_reading.open_time_list ?? '').isEmpty ? 0 : comb_webpage.webpage_reading.open_time_list!.split(',').length}',
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        /// TODO：打开文章分析页面
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              '文章分析：',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.analytics_rounded,
                            color:
                                q0_.bridge.flustars.functionality.isEmpty(comb_webpage.webpage_reading.article_analysis)
                                    ? Colors.grey
                                    : FlutterFlowTheme.of(context).tertiary,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (comb_webpage.has_stickers)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 25,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (var sticker in [
                              ...comb_webpage.generated_stickers,
                              ...comb_webpage.user_defined_sticker
                            ])
                              ui0_.sticker.small_sticker(sticker, on_tap: () async {}),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
