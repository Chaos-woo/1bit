import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// 存储目录
class StorageDirectory {
  /// 临时目录
  static late Directory _temporaryDirectory;

  /// 应用支持文件目录，不暴露给用户
  static late Directory _applicationSupportDirectory;

  /// 存放用户数据文件目录，用户可查看
  static late Directory _applicationDocumentsDirectory;

  static Future<void> init() async {
    _temporaryDirectory = await getTemporaryDirectory();
    _applicationSupportDirectory = await getApplicationSupportDirectory();
    _applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
  }

  /// 应用支持文件目录，不暴露给用户
  Directory get applicationSupportDirectory => _applicationSupportDirectory;

  /// 存放用户数据文件目录，用户可查看
  Directory get applicationDocumentsDirectory => _applicationDocumentsDirectory;

  /// 临时目录
  Directory get temporaryDirectory => _temporaryDirectory;
}
