import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:dio/dio.dart';
import 'package:qkit/qkit.dart';

class GithubInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? accessToken;
    if (options.extra.containsKey(k_pref_github_override_access_key)) {
      accessToken = options.extra[k_pref_github_override_access_key];
    } else {
      accessToken =
          QKit.bridge.flustars.preferences.getString(k_pref_github_access_key, defValue: '');
    }

    if (null == accessToken || accessToken.isEmpty) {
      handler.reject(DioError(
        requestOptions: options,
        response: null,
        type: DioErrorType.cancel,
        error: 'Not found Github Personal Access Token(classic)',
      ));
    }

    options.headers.addAll({
      "Accept": "application/vnd.github+json",
      "Authorization": "Bearer ${accessToken!}",
      "X-GitHub-Api-Version": "2022-11-28",
      "User-Agent": "1bit-app:Chaos-woo"
    });

    super.onRequest(options, handler);
  }
}
