import 'package:cw2bit/infrastructure/router/router.dart';
import 'package:cw2bit/public/ui/flutterflow_theme.dart';
import 'package:cw2bit/public/ui/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'logic.dart';

class GithubSettingPage extends StatelessWidget {
  const GithubSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<GithubSettingLogic>();
    final state = Get.find<GithubSettingLogic>().state;

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            QKit.route.back();
          },
        ),
        title: Text(
          'Github客户端设置',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                  child: Text(
                    '''
 提示：
1. 访问密钥将被用于请求Github API数据；
2. 访问密钥除了用于请求1bit仓库外，可能会请求其他Github仓库内容。
                  ''',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0,
                        ),
                  ),
                ),
              ),
              if (logic.show1bitRepository)
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: logic.repoOwnerTextController,
                    autofocus: false,
                    readOnly: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelText: '1bit Repository Owner',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.power,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                  ),
                ),
              if (logic.show1bitRepository)
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: logic.repoTextController,
                    autofocus: false,
                    readOnly: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelText: '1bit Repository',
                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(
                        Icons.store_mall_directory_rounded,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: logic.accessTokenTextController,
                        autofocus: false,
                        obscureText: false,
                        maxLines: 2,
                        decoration: InputDecoration(
                          isDense: false,
                          labelText: 'Access token',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                          hintText: 'Personal access tokens(classic)',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: 20,
                        borderWidth: 1,
                        buttonSize: 40,
                        icon: Icon(
                          Icons.local_see,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          String? ocrText = await QKit.route.to(rt_publicTextOcr) as String?;
                          logic.accessTokenTextController.text = ocrText ?? '';
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          bool isValidToken = await logic.checkAccessToken();
                          if (isValidToken) {
                            Bit1Ui.showSimpleSnackBar('当前【访问密钥】有效');
                          } else {
                            Bit1Ui.showSimpleSnackBar('当前【访问密钥】无效，请重新设置');
                          }
                        },
                        text: '访问密钥有效性检查',
                        icon: Icon(
                          Icons.save_as_rounded,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () {
                          logic.saveAccessToken();
                          Bit1Ui.showSimpleSnackBar('设置【访问密钥】完成');
                          QKit.route.back();
                        },
                        text: '保存访问密钥',
                        icon: Icon(
                          Icons.save_as_rounded,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
