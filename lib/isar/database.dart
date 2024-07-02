import 'package:isar/isar.dart';
import 'package:make_a_dream/common/logger_utils.dart';
import 'package:make_a_dream/isar/npc.dart';
import 'package:make_a_dream/isar/player_event.dart';
import 'package:make_a_dream/isar/player_record.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatabase {
  // ignore: avoid_init_to_null
  late Isar? isar = null;
  static final _instance = IsarDatabase._init();

  factory IsarDatabase() => _instance;

  IsarDatabase._init();

  Future initialDatabase() async {
    if (isar != null && isar!.isOpen) {
      return;
    }
    final dir = await getApplicationSupportDirectory();
    logger.info("database save to ${dir.path}");
    isar = await Isar.open(
      schemas,
      name: "make-a-dream",
      directory: dir.path,
    );
  }

  late List<CollectionSchema<Object>> schemas = [
    NpcSchema,
    PlayerEventSchema,
    PlayerRecordSchema
  ];
}
