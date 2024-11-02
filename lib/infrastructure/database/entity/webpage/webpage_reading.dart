import 'package:cw2bit/infrastructure/database/r1db.dart';
import 'package:drift/drift.dart';
import 'package:drift_model_generator/drift_model_generator.dart';

part 'webpage_reading.driftm.dart';

/// 网页阅读记录
@UseDrift(
  useSnakeCase: true,
)
class WebpageReading {
  @AutoIncrement()
  final int? id;

  @NotNull()
  final String url;

  @WithDefault('now()')
  @NotNull()
  final DateTime create_time;

  @WithDefault('now()')
  @NotNull()
  final DateTime update_time;

  /// 网页阅读进度，用于记录网页的阅读进度，单位为像素px，用于JS代码执行滚动条滚动
  @WithDefault(0.0)
  @NotNull()
  final double reading_scroll_top;

  /// 网页阅读进度，用于记录网页的阅读进度，单位为百分比%，与readingScrollTop配合计算获得网页的总Y轴长度
  @WithDefault(0.0)
  @NotNull()
  final double reading_progress;

  /// 特殊的冗余数据，用于区分不同app的记录
  /// 一般来说，用于表示该网页所属的应用
  @WithDefault('')
  @NotNull()
  final String app;

  /// 网页文章分析，用于记录网页的内容阅读和分析情况
  final String? article_analysis;

  /// URL来源，一般来说是获得这个URL的来源地址
  final String? source;

  WebpageReading({
    required this.id,
    required this.url,
    required this.create_time,
    required this.update_time,
    required this.reading_scroll_top,
    required this.reading_progress,
    required this.app,
    required this.article_analysis,
    required this.source,
  });
}
