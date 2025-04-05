import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_ddd/domain_event.dart';
import 'package:network_info_plus/network_info_plus.dart';

/// 网络信号
final class MobileNetwork {
  /// 网络信息
  final NetworkInfo network = NetworkInfo();

  /// 网络连接信息
  final Connectivity connectivity = Connectivity();

  MobileNetwork() {
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      INKs.events.publish(ConnectivityChangedEvent(result));
    });
  }

  /// 判断是否已连接网络
  ///
  /// [bluetooth] 是否算蓝牙连接
  ///
  /// return true 已连接, false 未连接
  Future<bool> isConnected({bool bluetooth = false}) async {
    ConnectivityResult result = await connectivityResult();
    if (result == ConnectivityResult.bluetooth && bluetooth) {
      return true;
    }

    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  /// 获取网络连接状态
  ///
  /// return [ConnectivityResult]
  Future<ConnectivityResult> connectivityResult() async {
    return await connectivity.checkConnectivity();
  }

  /// 是否是 Wifi 连接
  ///
  /// return true 是, false 否
  Future<bool> isWifi() async => ConnectivityResult.wifi == (await connectivityResult());

  /// 是否是 移动网络 连接
  ///
  /// return true 是, false 否
  Future<bool> isMobile() async => ConnectivityResult.mobile == (await connectivityResult());

  /// 是否是 以太网 连接
  ///
  /// return true 是, false 否
  Future<bool> isEthernet() async => ConnectivityResult.ethernet == (await connectivityResult());

  /// 是否是 蓝牙 连接
  Future<bool> isBluetooth() async => ConnectivityResult.bluetooth == (await connectivityResult());
}

/// 网络连接改变领域事件
class ConnectivityChangedEvent extends DomainEvent {
  final ConnectivityResult result;

  ConnectivityChangedEvent(this.result) : super(publisher: 'Network_Connectivity');

  /// 是否已经网络连接
  ///
  /// return true 是, false 否
  bool isConnected() {
    return isWifi() || isMobile() || isEthernet();
  }

  /// 是否是 Wifi 连接
  ///
  /// return true 是, false 否
  bool isWifi() => ConnectivityResult.wifi == result;

  /// 是否是 移动网络 连接
  ///
  /// return true 是, false 否
  bool isMobile() => ConnectivityResult.mobile == result;

  /// 是否是 以太网 连接
  ///
  /// return true 是, false 否
  bool isEthernet() => ConnectivityResult.ethernet == result;

  /// 是否是 蓝牙 连接
  bool isEBluetooth() => ConnectivityResult.bluetooth == result;
}
