import 'package:cw2bit/infrastructure/database/entity/tag/sticker.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';

class CombWebpageReadingSticker {
  final WebpageReading webpage_reading;
  final List<Sticker> generated_stickers;
  final List<Sticker> user_defined_sticker;

  CombWebpageReadingSticker({
    required this.webpage_reading,
    required this.generated_stickers,
    required this.user_defined_sticker,
  });

  bool get has_stickers => generated_stickers.length > 0 || user_defined_sticker.length > 0;

  List<Sticker> get mix_stickers => [...generated_stickers, ...user_defined_sticker];
}
