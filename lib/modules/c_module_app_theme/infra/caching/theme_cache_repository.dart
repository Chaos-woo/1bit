import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/modules/c_module_app_theme/domain/repository/theme_repository.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final kPfsThemeIndex = '__kPfsThemeIndex__';

  @override
  int getThemeIndex({int defaultThemeIndex = 0}) {
    return INKs.sdk.preferences.getInt(kPfsThemeIndex, defaultValue: defaultThemeIndex)!;
  }

  @override
  Future<void> setThemeIndex(int index) async {
    await INKs.sdk.preferences.putInt(kPfsThemeIndex, index);
  }
}
