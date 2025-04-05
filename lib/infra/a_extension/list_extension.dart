import 'package:cw2bit/infra/a_value/sort_value.dart';

extension ListMultiSortExtension on List {
  /// 根据多个属性对列表进行排序。
  ///
  /// [criteria] 参数是一个 `List<PropertySortCriteria>` 类型的列表，用于指定排序的属性和排序方式。
  ///   - `PropertySortCriteria` 类包含两个属性：
  ///     - `property`：需要排序的属性名，类型为 String。
  ///     - `criteria`：排序准则，类型为 `SortCriteria`，包含 `sort_order`（升序排列的值，默认为1）和 `reverse_sort_order`（降序排列的值，默认为-1）。
  ///
  /// 示例：假设有一个包含多个对象的列表，每个对象都有 `name`（字符串类型）、`age`（整数类型） 和 `createTime`（时间类型） 属性。
  ///  对该列表先按 `name` 进行升序排列，再按 `age` 进行降序排列，最后按 `createTime` 进行降序排列。
  sortedByMultiProperties(List<PropertySortCriteria> criteria) {
    /// 比较a和b的第i个属性
    /// 若a的i属性为null时，则默认b大于的情况，反之
    int compare(int i, dynamic a, dynamic b, List<PropertySortCriteria> criteria) {
      if (a.get(criteria[i].property) == null && b.get(criteria[i].property) == null) {
        return 0;
      }

      if (a.get(criteria[i].property) == null) {
        return criteria[i].criteria.reverseSortOrder;
      }

      if (b.get(criteria[i].property) == null) {
        return criteria[i].criteria.sortOrder;
      }

      if (a.get(criteria[i].property) is DateTime && b.get(criteria[i].property) is DateTime) {
        DateTime dateA = a.get(criteria[i].property);
        DateTime dateB = b.get(criteria[i].property);
        return dateA.compareTo(dateB) == 0
            ? 0
            : (dateA.isAfter(dateB) ? criteria[i].criteria.sortOrder : criteria[i].criteria.reverseSortOrder);
      }

      if (a.get(criteria[i].property) is String && b.get(criteria[i].property) is String) {
        return a.get(criteria[i].property).compareTo(b.get(criteria[i].property));
      }
      return a.get(criteria[i].property) == b.get(criteria[i].property)
          ? 0
          : (a.get(criteria[i].property) > b.get(criteria[i].property)
              ? criteria[i].criteria.sortOrder
              : criteria[i].criteria.reverseSortOrder);
    }

    // 所有属性比较，直到传入的最后一个属性
    int sortAll(a, b, List<PropertySortCriteria> criteria) {
      int i = 0, result = 0; // 默认相等
      while (i < criteria.length) {
        result = compare(i, a, b, criteria);
        if (result != 0) break;
        i++;
      }
      return result;
    }

    if (criteria.isEmpty || isEmpty) {
      return this;
    }

    sort((a, b) => sortAll(a, b, criteria));
  }
}
