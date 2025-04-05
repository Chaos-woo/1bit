/// 系统操作
enum GenericOperation {
  query,
  add,
  delete,
  update,
}

extension GenericOperationExtension on GenericOperation {
  bool get isAdd => this == GenericOperation.add;

  bool get isDel => this == GenericOperation.delete;

  bool get isUpdate => this == GenericOperation.update;

  bool get isQuery => this == GenericOperation.query;
}
