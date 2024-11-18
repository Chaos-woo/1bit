import 'package:cw2bit/domain/bing/service/bing_mgr.dart';
import 'package:cw2bit/infrastructure/database/r_database.dart';
import 'package:cw2bit/public/ui/theme/themes.dart';

import 'api/apis.dart';

final class c0_ {
  static final repo_drift = DatabaseMgr.repos;

  static final mgr_theme = ThemesMgr.getx;
  static final mgr_bing = BingMgr.getx;

  static final apis_github = Apis.github;

  c0_._();
}
