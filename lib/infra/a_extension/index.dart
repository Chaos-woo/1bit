import 'package:cw2bit/infra/a_extension/delay.dart';
import 'package:cw2bit/infra/a_extension/id_gen.dart';
import 'package:cw2bit/infra/a_extension/mobile_network.dart';
import 'package:cw2bit/infra/a_extension/package.dart';
import 'package:cw2bit/infra/a_extension/system_chrome.dart';
import 'package:cw2bit/infra/a_extension/terminal_device.dart';

final class INKTool {
  final Delay delay = Delay();
  final IdGenerator idGenerator = IdGenerator();
  final TerminalDevice terminalDevice = TerminalDevice();
  final AppPackage package = AppPackage();
  final MobileNetwork network = MobileNetwork();
  final SystemChromes systemChromes = SystemChromes();
}
