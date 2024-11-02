class _ReferParentGetXComp {
  const _ReferParentGetXComp();
}

class _ReferExtraModuleGetXComp {
  const _ReferExtraModuleGetXComp();
}

/**
 * 存在引用上层GetX组件行为
 */
const Object use_parent_module_getx = _ReferParentGetXComp();
/**
 * 存在引用额外模块GetX组件行为
 */
const Object use_extra_module_getx = _ReferExtraModuleGetXComp();
