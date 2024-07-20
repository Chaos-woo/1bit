# cw2bit

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 变量命名规则
* c_xXxx : 常量
* k_xXxx : 用于Key的常量字符串
* rt_xXxx : 命名路由常量字符串
* m_xXxx : 非公开且非静态的属性（可直接访问和设置）
* s_xXxx : 静态变量
* _m_xxXxx : dart隐私属性（需要有特定访问和设置逻辑的，与m_xXxx二选一）或实际就是不想外部处理的

## 常量放置规则
1. 默认放置在相关模块内的常量文件内，例如github_constant.dart
2. 一般直接定义为全局的，不放置在类下
3. 不需要多处访问的，将常量集中放到最接近业务代码的位置