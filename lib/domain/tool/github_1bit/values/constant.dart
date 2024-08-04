import 'package:flustars_flutter3/flustars_flutter3.dart';

/// Github访问密钥key
const String k_pref_github_access_key = '#kGithubAccessKey';
const String k_pref_github_override_access_key = '#kOverrideGithubAccessKey';

/// issues状态常量
const c_issues_state_open = 'Open';
const c_issues_state_closed = 'Closed';

/// 1bit仓库信息
const c_1bit_repo_owner = 'Chaos-woo';
const c_1bit_repo = '1bit';

/// issues时间格式化
final c_issues_date_time_format = '${DateFormats.y_mo_d}, ${DateFormats.h_m}';

const c_issues_bug_template = '''
【模块-BUG】

【主题-简要描述】

【详细描述】


''';

const c_issues_feature_template = '''
【模块-Feature】

【主题-简要描述】

【详细描述】


''';

const c_issues_enhance_template = '''
【模块-Enhance】

【主题-简要描述】

【详细描述】


''';

const c_issues_question_template = '''
【模块-Question】

【主题-简要描述】

【详细描述】


''';

/// 前后页面因Github接口提交动作而产生的后置处理
enum GithubApiDataPostAction {
  // 接口数据已提交，并返回上一页面
  posted_data_then_back,
  // 无接口数据提交操作，并退出了页面
  no_action_then_back
}
