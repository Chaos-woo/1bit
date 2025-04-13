import 'package:cw2bit/infra/a_ddd/domain_event.dart';

class ThemeChangedEvent extends DomainEvent {
  final int themeIndex;
  final bool isDarkMode;
  final String name;

  ThemeChangedEvent(
    this.themeIndex,
    this.isDarkMode,
    this.name,
  ) : super(publisher: '__theme_aggregate__');
}
