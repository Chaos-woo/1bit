import 'package:flustars_flutter3/flustars_flutter3.dart';

/// Github访问密钥key
const String k_githubAccessKey = '#kGithubAccessKey';
const String k_githubOverrideAccessKey = '#kOverrideGithubAccessKey';

/// issues状态常量
const c_issuesStateOpen = 'Open';
const c_issuesStateClosed = 'Closed';

/// 1bit仓库信息
const c_1bitRepoOwner = 'Chaos-woo';
const c_1bitRepo = '1bit';

/// issues时间格式化
final c_issuesDateTimeFormat = '${DateFormats.y_mo_d}, ${DateFormats.h_m}';

const c_issuesBugTemplate = '''
【模块-BUG】

【主题-简要描述】

【详细描述】


''';

const c_issuesFeatureTemplate = '''
【模块-Feature】

【主题-简要描述】

【详细描述】


''';

const c_issuesEnhanceTemplate = '''
【模块-Enhance】

【主题-简要描述】

【详细描述】


''';

const c_issuesQuestionTemplate = '''
【模块-Question】

【主题-简要描述】

【详细描述】


''';

/// 前后页面因Github接口提交动作而产生的后置处理
enum GithubApiDataPostAction {
  // 接口数据已提交，并返回上一页面
  postedDataThenBack,
  // 无接口数据提交操作，并退出了页面
  noActionThenBack
}
