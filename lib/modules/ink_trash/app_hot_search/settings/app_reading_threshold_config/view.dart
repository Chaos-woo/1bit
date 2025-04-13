import 'package:cw2bit/infrastructure/ext/icon_extension.dart';
import 'package:cw2bit/modules/c_module_app_theme/provider/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/impl/ui_dialog.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class AppReadingThresholdConfigPage extends StatelessWidget {
  AppReadingThresholdConfigPage({Key? key}) : super(key: key);

  final _glob_k_threshold_config_list = GlobalKey();

  final logic = Get.put<AppReadingThresholdConfigLogic>(AppReadingThresholdConfigLogic());
  final state = Get.find<AppReadingThresholdConfigLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: ui0_.icons.arrow_back.flow_appbar_back_button(),
        flexibleSpace: ui0_.appbar.bing_image_appbar_flexible_space(
          title: 'APP阅读阈值设置',
          icon: ui0_.icons.setting,
          center_title: false,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                child: Text(
                  '''
⛔功能简介：网页阅读时，APP会自动记录阅读进度，并根据设置的阅读阈值来提醒用户阅读。
 
⛔多数网页存在隐藏页面元素、隐藏用户评论，或是需要登录状态才会显示的做法。因此，为了在自动记录阅读进度时，需要有效判断用户是否阅读完成，所以为每个APP设置阅读完成的阈值。
 
⛔用户自定义：默认阅读完成的阈值设置为80%，用户可以根据自己的喜好来调整阈值。全部APP已经在应用开发时根据实际情况进行了阈值默认值设置（0%认为看过即完成，一般不建议记录阅读进度），用户可以进行调整或恢复该阈值。
''',
                  softWrap: true,
                  maxLines: 15,
                ),
              ),
              SizedBox(height: 3),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: GetBuilder<AppReadingThresholdConfigLogic>(
                    id: logic.k_threshold_config_list_view_id,
                    builder: (_) {
                      return ListView.separated(
                        key: _glob_k_threshold_config_list,
                        separatorBuilder: (_, __) => q0_.ui.gap.v(5),
                        itemCount: state.threshold_configs.length,
                        itemBuilder: (_, index) {
                          final threshold_config = state.threshold_configs[index];
                          return ListTile(
                            leading: Icon(
                              threshold_config.should_show_config ? Icons.event_available : Icons.event_busy,
                              color: threshold_config.should_show_config
                                  ? FlutterFlowTheme.of(context).success
                                  : FlutterFlowTheme.of(context).warning,
                            ),
                            title: Text(
                              threshold_config.threshold.app,
                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            subtitle: Text(
                              '默认值：${threshold_config.in_advance_threshold}%${threshold_config.in_advance_threshold == 0 ? '（进入即完成）' : ''}',
                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            trailing: Text(
                              threshold_config.should_show_config
                                  ? '${threshold_config.threshold.as_int_percent}%'
                                  : '进度未记录',
                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                    letterSpacing: 0.0,
                                    fontSize: 16,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                  ),
                            ),
                            tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                            dense: true,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onTap: threshold_config.should_show_config
                                ? () async {
                                    // 短按修改阈值
                                    await ui0_.dialog.show_single_input_dialog(
                                        title: '阈值设置',
                                        initial_value: (await threshold_config.threshold.as_int_percent).toString(),
                                        on_cancel: () {},
                                        max_length: -1,
                                        on_confirm: (value) async {
                                          var threshold = int.tryParse(value);
                                          if (threshold == null || threshold < 0 || threshold > 100) {
                                            q0_.ui.toast.show('请输入有效的阅读完成阈值，范围为0~100');
                                          } else {
                                            await logic.set_read_progress_threshold(
                                                threshold, threshold_config.threshold.app);
                                          }
                                        });
                                  }
                                : null,
                            onLongPress: () async {
                              // 长按更多操作
                              await ui0_.dialog.show_operate_dialog(
                                title: '更多操作',
                                operations: [
                                  if (threshold_config.should_show_config)
                                    DialogOperation.from_icon_text(
                                      title: '恢复默认值',
                                      on_tap: () async {
                                        await logic.reset_reading_progress_threshold(threshold_config.threshold.app);
                                      },
                                      icon: Icons.cached_rounded,
                                    ),
                                  DialogOperation.from_icon_text(
                                    title: '${threshold_config.should_show_config ? '关闭' : '开启'}阅读进度自动记录',
                                    on_tap: () async {
                                      await logic.operate_app_reading_record_auto_recording(
                                          threshold_config.threshold.app,
                                          open: !threshold_config.should_show_config);
                                    },
                                    icon: threshold_config.should_show_config
                                        ? Icons.lock_outline_rounded
                                        : Icons.lock_open_rounded,
                                  ),
                                  if (threshold_config.should_show_config)
                                    DialogOperation.from_icon_text(
                                      title: '自动计算阅读阈值',
                                      on_tap: () async {
                                        await logic
                                            .test_user_reading_progress_threshold(threshold_config.threshold.app);
                                      },
                                      icon: Icons.calculate_outlined,
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
