# cw2bit

1Bit application for Information acquisition.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 编码规则

### 变量命名规则
* c_xXxx : 常量
* k_xXxx : 用于Key的常量字符串
* rt_xXxx : 命名路由常量字符串
* m_xXxx : 非公开且非静态的属性（可直接访问和设置）
* s_xXxx : 静态变量
* _m_xxXxx : dart隐私属性（需要有特定访问和设置逻辑的，与m_xXxx二选一）或实际就是不想外部处理的

### 常量放置规则
1. 默认放置在相关模块内的常量文件内，例如github_constant.dart
2. 一般直接定义为全局的，不放置在类下
3. 不需要多处访问的，将常量集中放到最接近业务代码的位置

### GetX库的路径参数定义
1. 路径参数定义在Logic类文件中，并且使用类进行接受和解析
2. 如何使用类进行定义？：其实是将路径参数名放置到类中
3. 如何使用类进行接受和解析？：其实是提供具体路径参数名的方法，通过GetX的方法直接获取到具体路径参数值
4. 例如：`String get path_param => Get.parameters['XxLogic.pathDefine.path_param'];`

## 内容板块
* 1Bit：应用小工具，应用测试，1bit仓库问题提交
* 朝闻道：稍后读，热搜资讯，Ai资讯
* TV.SO：BiliBili经常关注，UP主追踪等
* 标签站：各类标签数据