/// 排序规则
enum SortCriteria {
  /// 正序
  ascending,

  /// 倒序
  descending,
}

extension SortCriteriaExtension on SortCriteria {
  bool get isAsc => this == SortCriteria.ascending;

  bool get isDesc => this == SortCriteria.descending;

  /// 根据是否正序返回排序算法的1或-1
  int get sortOrder => isAsc ? 1 : -1;

  /// 根据是否倒序返回排序算法的1或-1
  int get reverseSortOrder => isAsc ? -1 : 1;
}

/// 属性排序规则
final class PropertySortCriteria {
  /// 属性名
  final String property;

  /// 排序规则
  final SortCriteria criteria;

  PropertySortCriteria._(this.property, this.criteria);

  static PropertySortCriteria asc(String property) => PropertySortCriteria._(property, SortCriteria.ascending);

  static PropertySortCriteria desc(String property) => PropertySortCriteria._(property, SortCriteria.descending);
}

/// 对象自定义排序函数的排序规则
class ObjectSortCriteria<T> {
  final int Function(T a, T b) compare;
  SortCriteria? criteria;

  ObjectSortCriteria(this.compare, {this.criteria = SortCriteria.ascending});

  ObjectSortCriteria.asc(int Function(T a, T b) compare) : this(compare, criteria: SortCriteria.ascending);

  ObjectSortCriteria.desc(int Function(T a, T b) compare) : this(compare, criteria: SortCriteria.descending);
}
