import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// 存储目录
final class INKStorageDirectory {
  /// 临时目录
  static late Directory _temporaryDirectory;

  /// 应用支持目录：用于存储应用运行时所需，但不需要暴露给用户的文件，如配置文件、数据库等。
  /// 这些文件不应该被用户直接访问或修改。
  static late Directory _applicationSupportDirectory;

  /// 应用文档目录：用于存储用户生成的文件，例如用户保存的文档、图片等。
  /// 用户期望能够访问和管理这个目录下的文件。
  static late Directory _applicationDocumentsDirectory;

  /// 初始化存储目录
  static Future<void> setup() async {
    _temporaryDirectory = await getTemporaryDirectory();
    _applicationSupportDirectory = await getApplicationSupportDirectory();
    _applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  }

  /// 应用支持文件目录：
  /// 用于存储应用运行时所需，但不需要暴露给用户的文件，例如：
  /// - 应用的数据库文件（如 SQLite 数据库文件）。
  /// - 应用的配置文件（如 JSON 或 XML 格式的配置文件）。
  ///
  /// 一般来说，这些文件会存储在以下目录（具体路径会根据操作系统和应用而异）：
  /// - iOS: `<Application_Home>/Library/Application Support/`
  /// - Android: `/data/user/<user-id>/<package-name>/app_flutter/` (可能因 Android 版本和设备而异)
  /// - macOS: `<Application_Home>/Library/Application Support/<Bundle Identifier>/`
  Directory get applicationSupportDirectory => _applicationSupportDirectory;

  /// 应用文档目录：
  /// 用于存储用户生成或需要访问的文件，例如：
  /// - 用户保存的文档（如 .txt, .docx 文件）。
  /// - 用户上传或下载的图片或视频文件。
  ///
  /// 一般来说，这些文件会存储在以下目录（具体路径会根据操作系统和应用而异）：
  /// - iOS: `<Application_Home>/Documents/`
  /// - Android: `/data/user/<user-id>/<package-name>/app_flutter/` (可能因 Android 版本和设备而异)
  Directory get applicationDocumentsDirectory => _applicationDocumentsDirectory;

  /// 临时目录：
  /// 用于存储应用运行时产生的临时文件，例如：
  /// - 缓存的临时图片文件。
  /// - 下载文件过程中的临时文件。
  Directory get temporaryDirectory => _temporaryDirectory;
}
