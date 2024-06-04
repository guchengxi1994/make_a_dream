import 'package:isar/isar.dart';

part 'player_record.g.dart';

@collection
class PlayerRecord {
  Id id = Isar.autoIncrement;
  int createAt = DateTime.now().millisecondsSinceEpoch;

  /// 头像路径
  String? avatar;

  /// 自定义名称
  late String name = "player";

  /// 属性点
  late int attributes = 0;

  late PlayerAbility ability = PlayerAbility();

  late PlayerKnowledge knowledge = PlayerKnowledge();
}

@embedded
class PlayerAbility {
  late double /* 持久力 */ endurance = 10;
  late double /* 体力 */ vitality = 10;
  late double /* 记忆力 */ attunement = 0;
  late double /* 力量 */ strength = 0;
  late double /* 敏捷, move speed */ dexterity = 32;
  late double /* 智力 ,根据智力可以获取更高级别的知识*/ intelligence = 32;
}

@embedded
class PlayerKnowledge {
  late double math = 0;
  late double language = 0;
  late double history = 0;
  late double /* 地理 */ geography = 0;
  late double /* 化学 */ chemistry = 0;
  late double /* 物理 */ physics = 0;
  late double /* 生物 */ biography = 0;
  late double /* IT */ it = 0;
}
