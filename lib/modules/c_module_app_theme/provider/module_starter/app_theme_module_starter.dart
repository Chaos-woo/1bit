import 'package:cw2bit/infra/a_app_setup/module_starter.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/aggregate/theme_aggregate.dart';
import 'package:cw2bit/modules/c_module_app_theme/infra/caching/theme_cache_repository.dart';
import 'package:get/get.dart';

class AppThemeModuleStarter extends ModuleStarter {
  @override
  Future<void> setup() async {
    Get.put(
        ThemeAggr(
          userThemeRepository: ThemeRepositoryImpl(),
        ),
        tag: ThemeAggr.getxTag);
  }
}
