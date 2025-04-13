import 'package:cw2bit/modules/feature_explore/github_1bit/values/constant.dart';
import 'package:dio/dio.dart';
import 'package:qkit/qkit.dart';

class GithubInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? access_token;
    if (options.extra.containsKey(k_pfs_github_override_access_key)) {
      access_token = options.extra[k_pfs_github_override_access_key];
    } else {
      access_token = q0_.bridge.flustars.preferences.getString(k_pfs_github_access_key, default_value: '');
    }

    if (null == access_token || access_token.isEmpty) {
      handler.reject(DioError(
        requestOptions: options,
        response: null,
        type: DioErrorType.cancel,
        error: 'Not found Github Personal Access Token(classic)',
      ));
      return;
    }

    options.headers.addAll({
      "Accept": "application/vnd.github+json",
      "Authorization": "Bearer ${access_token!}",
      "X-GitHub-Api-Version": "2022-11-28",
      "User-Agent": "1bit-app:Chaos-woo"
    });

    super.onRequest(options, handler);
  }
}
