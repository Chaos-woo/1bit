import 'package:cw2bit/infra/a_ddd/repository.dart';

abstract class ThemeRepository extends Repository {
  Future<void> setThemeIndex(int index);

  int getThemeIndex({int defaultThemeIndex});
}
