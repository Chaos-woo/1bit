class AppHotSearchTabbarPageState {
  /// 当前选择的APP
  String app = '';

  /// 可选择的所有APP
  final List<String> _m_apps = [];

  List<String> get apps => _m_apps;

  void set apps(List<String> apps) {
    _m_apps.clear();
    _m_apps.addAll(apps);
  }

  AppHotSearchTabbarPageState() {
    ///Initialize variables
  }
}
