import 'package:isar/isar.dart';

part 'npc.g.dart';

@collection
class Npc {
  Id id = Isar.autoIncrement;

  // @Index(unique: true)
  late String name;

  late List<History> history = [];

  late int /* 好感度 */ likability = 0;

  /// [meet] 之后就不再执行 [introduce]逻辑
  /// 如果 npc [plot] 中没有 [introduce]逻辑，
  /// 则只会进行最简单的重复性对话
  @enumerated
  late NpcStage stage = NpcStage.unknow;
}

enum NpcStage { /* 遇见过 */ meet, /* 未知 */ unknow, /* wow */ admire }

enum HistoryType { player, npc }

@embedded
class History {
  int createAt = DateTime.now().millisecondsSinceEpoch;
  late String content;

  @enumerated
  late HistoryType type;
}
