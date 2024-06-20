import 'package:isar/isar.dart';

part 'player_event.g.dart';

enum PlayerEventType { /* 对话 */ talk, /* 测试 */ exam, /* 任务 */ mission }

@collection
class PlayerEvent {
  Id id = Isar.autoIncrement;
  int createAt = DateTime.now().millisecondsSinceEpoch;
  @enumerated
  late PlayerEventType playerEventType = PlayerEventType.talk;
}
