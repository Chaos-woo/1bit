import 'package:cw2bit/domain/tool/github_1bit/issues/values/constant.dart';
import 'package:dio/dio.dart';
import 'package:qkit/qkit.dart';

class GithubInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? accessToken =
        QKit.bridge.flustars.preferences.getString(k_githubAccessKey, defValue: '');

    if (null == accessToken || accessToken.isEmpty) {
      handler.reject(DioError(
        requestOptions: options,
        response: null,
        type: DioErrorType.other,
        error: 'Not found Github AccessToken',
      ));
    }

    options.headers.addAll({
      "Accept": "application/vnd.github+json",
      "Authorization": "Bearer ${accessToken!}",
      "X-GitHub-Api-Version": "2022-11-28",
    });

    super.onRequest(options, handler);
  }
}
