import 'package:uuid/uuid.dart';

class QIdGen {
  static const _uuid = Uuid();

  String uuidV4() => _uuid.v4();

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
}