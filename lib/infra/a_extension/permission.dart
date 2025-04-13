import 'package:permission_handler/permission_handler.dart';

/// 系统权限, 可申请权限如下：
/// 注意：每项可申请权限在安卓中还需要对应配置，例如：<uses-permission android:name="android.permission.CAMERA" />
/// 1. calendar: 访问日历权限，用于读取和写入日历数据
///   安卓配置: <uses-permission android:name="android.permission.READ_CALENDAR" />
///   安卓配置: <uses-permission android:name="android.permission.WRITE_CALENDAR" />
/// 2. camera: 访问相机权限，用于拍照和录像
///   安卓配置: <uses-permission android:name="android.permission.CAMERA" />
/// 3. contacts: 访问联系人权限，用于读取联系人信息
///   安卓配置: <uses-permission android:name="android.permission.READ_CONTACTS" />
/// 4. location: 访问位置权限，用于获取设备的地理位置信息
///   安卓配置: <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
/// 5. locationAlways: 在后台始终访问位置信息，即使应用不在前台
///   安卓配置: <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
/// 6. locationWhenInUse: 当应用在前台运行时访问位置信息
///   安卓配置: <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
/// 7. mediaLibrary: 访问媒体库权限，用于读取和写入图片、视频等媒体文件
/// 8. microphone: 访问麦克风权限，用于录音
///   安卓配置: <uses-permission android:name="android.permission.RECORD_AUDIO" />
///   <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
/// 9. phone: 访问电话权限，用于拨打电话、读取电话状态等
///   安卓配置: <uses-permission android:name="android.permission.CALL_PHONE" />
///   <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
///   <uses-permission android:name="android.permission.READ_CALL_LOG"/>
///   <uses-permission android:name="android.permission.WRITE_CALL_LOG"/>
///   <uses-permission android:name="android.permission.ANSWER_PHONE_CALLS"/>
/// 10. photos: 访问照片权限，用于读取和写入照片
///   安卓配置: <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
///   <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
/// 11. photosAddOnly: 仅添加照片的权限，不会获取现有照片
///    说明：目前不需要安卓配置
/// 12. reminders: 访问提醒事项权限，用于读取和写入提醒事项
///   安卓配置: <uses-permission android:name="com.android.alarm.permission.SET_ALARM"/>
/// 13. sensors: 访问传感器权限，用于读取传感器数据
///   安卓配置: <uses-permission android:name="android.permission.BODY_SENSORS" />
/// 14. sms: 访问短信权限，用于读取和发送短信
///   安卓配置: <uses-permission android:name="android.permission.SEND_SMS" />
///   <uses-permission android:name="android.permission.READ_SMS"/>
///   <uses-permission android:name="android.permission.RECEIVE_SMS"/>
///   <uses-permission android:name="android.permission.RECEIVE_MMS"/>
///   <uses-permission android:name="android.permission.RECEIVE_WAP_PUSH"/>
/// 15. speech: 访问语音权限，用于语音识别
///   说明：目前不需要安卓配置
/// 16. storage: 访问存储权限，用于读取和写入文件
///    安卓配置：<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
///    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
/// 17. ignoreBatteryOptimizations: 允许忽略电池优化，可能会影响电池续航
///    安卓配置：<uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"/>
/// 18. notification: 访问通知权限，用于接收和展示通知
///    安卓配置：需要在代码中配置通知渠道等
/// 19. accessMediaLocation: 访问媒体位置，用于获取媒体文件的位置信息
///    安卓配置：<uses-permission android:name="android.permission.ACCESS_MEDIA_LOCATION"/>
/// 20. activityRecognition: 访问活动识别，用于识别用户的活动类型
///    安卓配置：<uses-permission android:name="android.permission.ACTIVITY_RECOGNITION"/>
/// 21. manageExternalStorage: 管理外部存储的权限，允许对外部存储进行更广泛的操作
///    安卓配置：<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
/// 22. systemAlertWindow: 悬浮窗权限
///    安卓配置：<uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW"/>
///
final class INKPermission {
  /// 检查权限状态
  ///
  /// [permission] 要检查的权限
  /// [onGranted] 权限被授予回调
  /// [deniedAutoRequest] 权限被拒绝是否自动请求
  /// [onDenied] 权限被拒绝回调
  /// [onRestricted] 权限受到限制，例如家长控制，则需要用户进行额外的操作
  /// [onPermanentlyDenied] 权限被永久拒绝，则需要用户手动启用权限
  Future<void> check(
    Permission permission, {
    Function()? onGranted,
    bool deniedAutoRequest = true,
    Function()? onDenied,
    Function()? onRestricted,
    Function()? onPermanentlyDenied,
  }) async {
    var status = await permission.status;
    if (status.isDenied) {
      /// 如果权限被拒绝，可以尝试再次请求权限
      onDenied?.call();
      if (deniedAutoRequest) {
        request(
          permission,
          onGranted: onGranted,
        );
      }
    } else if (status.isGranted) {
      /// 已经授予了权限
      onGranted?.call();
    } else if (status.isRestricted) {
      /// 如果权限受到限制，例如家长控制，则需要用户进行额外的操作
      onRestricted?.call();
    } else if (status.isPermanentlyDenied) {
      /// 如果权限被永久拒绝，则需要用户手动启用权限
      onPermanentlyDenied?.call();
      openAppSettings();
    }
  }

  /// 请求权限
  ///
  /// [permission] 要请求的权限
  /// [onGranted] 权限被授予回调
  /// [onDenied] 权限被拒绝回调
  Future<void> request(
    Permission permission, {
    Function()? onGranted,
    Function()? onDenied,
    Function()? onPermanentlyDenied,
  }) async {
    var status = await permission.request();
    if (status.isGranted) {
      /// 用户授予了权限
      onGranted?.call();
    } else if (status.isDenied) {
      /// 用户拒绝了权限
      onDenied?.call();
    } else if (status.isPermanentlyDenied) {
      /// 用户永久拒绝了权限，需要手动启用权限
      onPermanentlyDenied?.call();
      openAppSettings();
    }
  }
}
