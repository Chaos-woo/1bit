import 'package:cw2bit/infra/a_ui/animated_switcher.dart';
import 'package:cw2bit/modules/c_module_theme/flutterflow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';

class INKMultiListTile extends StatelessWidget {
  final String? title;
  final List<BaseListTileItem> items;

  const INKMultiListTile({super.key, this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var item in items)
                switch (item) {
                  JumpingListTileItem() => _buildJumpingListTile(item, context),
                  SelectableListTileItem() => _buildSelectableListTile(item, context),
                  OnOffSwitcherListTileItem() => _buildSwitcherListTile(item, context),
                  ReadableListTileItem() => _buildReadableListTile(item, context),
                }
            ],
          ),
        ),
      ],
    );
  }

  _buildJumpingListTile(JumpingListTileItem item, BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: 70,
            maxHeight: 120,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0,
                color: FlutterFlowTheme.of(context).primaryBackground,
                offset: Offset(
                  0,
                  1,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 16, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Icon(
                      item.icon,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 32,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: FlutterFlowTheme.of(context).bodyLarge.override(letterSpacing: 0.0),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            item.subtitle ?? '',
                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSelectableListTile<T>(SelectableListTileItem<T> item, BuildContext context) {
    return ValueBuilder(
      initialValue: item.values,
      builder: (newVal, updater) {
        return InkWell(
          onTap: () async {
            List<T> newValue = await item.select(item.values);
            item.values = newValue;
            updater(newValue);
          },
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: 70,
                maxHeight: 120,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    offset: Offset(
                      0,
                      1,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Icon(
                          item.icon,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 32,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.title,
                                  style: FlutterFlowTheme.of(context).bodyLarge.override(letterSpacing: 0.0),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Text(
                                          item.showSelectedOptionValue,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(letterSpacing: 0.0),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.chevron_right_rounded,
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        size: 24,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                item.subtitle ?? '',
                                style: FlutterFlowTheme.of(context).labelMedium.override(letterSpacing: 0.0),
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _buildSwitcherListTile(OnOffSwitcherListTileItem item, BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 70, maxHeight: 120),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: FlutterFlowTheme.of(context).primaryBackground,
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Icon(
                    item.icon,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 32,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.title,
                            style: FlutterFlowTheme.of(context).bodyLarge.override(letterSpacing: 0.0),
                          ),
                          AnimatedOnOffSwitcher(
                              initialState: item.initialState,
                              onChanged: (state) async {
                                await item.onChanged?.call(state);
                              }),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          item.subtitle ?? '',
                          style: FlutterFlowTheme.of(context).labelMedium.override(letterSpacing: 0.0),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildReadableListTile(ReadableListTileItem item, BuildContext context) {
    return InkWell(
      onTap: () async {
        await item.onTap?.call();
      },
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 70, maxHeight: 120),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0,
                color: FlutterFlowTheme.of(context).primaryBackground,
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 16, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Icon(
                      item.icon,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 32,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: FlutterFlowTheme.of(context).bodyLarge.override(letterSpacing: 0.0),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            item.subtitle ?? '',
                            style: FlutterFlowTheme.of(context).labelMedium.override(letterSpacing: 0.0),
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20,
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

sealed class BaseListTileItem {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Function()? onTap;

  BaseListTileItem({required this.title, required this.subtitle, required this.icon, required this.onTap});
}

class JumpingListTileItem extends BaseListTileItem {
  JumpingListTileItem({required super.title, required super.subtitle, required super.icon, required super.onTap});
}

class SelectableListTileItem<T> extends BaseListTileItem {
  List<T> values;
  Future<List<T>> Function(List<T>) select;
  String Function(List<T>)? selectedOptionShowTransformer;

  SelectableListTileItem({
    required super.title,
    required super.subtitle,
    required super.icon,
    required this.values,
    required this.select,
  }) : super(onTap: null);

  String get showSelectedOptionValue => selectedOptionShowTransformer?.call(values) ?? '';
}

class OnOffSwitcherListTileItem extends BaseListTileItem {
  AnimatedOnOffState initialState;
  Function(AnimatedOnOffState)? onChanged;

  OnOffSwitcherListTileItem({
    required super.title,
    required super.subtitle,
    required super.icon,
    required this.initialState,
    this.onChanged,
  }) : super(onTap: null);
}

class ReadableListTileItem extends BaseListTileItem {
  ReadableListTileItem({required super.title, required super.subtitle, required super.icon, required super.onTap});
}
