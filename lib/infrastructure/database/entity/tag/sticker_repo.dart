import 'package:cw2bit/infrastructure/database/entity/r1_database_import_mixin.dart';
import 'package:cw2bit/infrastructure/database/entity/tag/sticker.dart';
import 'package:cw2bit/infrastructure/database/r_database.dart';
import 'package:get/get.dart' hide Value;

class StickerRepo extends GetxService with R1DatabaseMixin {
  static final String getx_tag = '__getx_sticker_repo__';

  static StickerRepo get getx => Get.find(tag: getx_tag);

  Future<List<Sticker>> batch_add_stickers(List<StickersCompanion> stickers) async {
    var new_stickers = <Sticker>[];
    for (var sticker in stickers) {
      var new_sticker = await database.into(database.stickers).insertReturning(sticker);
      new_stickers.add(new_sticker);
    }

    return new_stickers;
  }
}
