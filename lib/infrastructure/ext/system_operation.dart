/// 系统操作
enum GenericOperation {
  add,
  delete,
  update,
}

extension GenericOperationExt on GenericOperation {
  bool get is_add => this == GenericOperation.add;

  bool get is_del => this == GenericOperation.delete;

  bool get is_update => this == GenericOperation.update;
}
