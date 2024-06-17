import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:isar/isar.dart';
import 'package:make_a_dream/isar/npc.dart';

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

  /// 获得的生就
  /// TODO 能不能通过大模型生成呢？
  late List<Achievement> achievements = [];

  /// 进行的时间；in seconds
  int duration = 0;

  /// 进行的游戏天数
  int days = 0;

  int? lastSaved;

  IsarLinks<Npc> npcs = IsarLinks();
}

@embedded
class Achievement {
  late String name;
  String? iconPath;
  late String description;
  int createAt = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(Object other) {
    if (other is! Achievement) {
      return false;
    }
    return name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}

const ticks = [20, 40, 60, 80, 100];

/// max 100; min 0
@embedded
class PlayerAbility {
  late double /* 持久力 */ endurance = 10;
  late double /* 体力 */ vitality = 10;
  late double /* 记忆力 */ attunement = 0;
  late double /* 力量 */ strength = 0;
  late double /* 敏捷, move speed */ dexterity = 32;
  late double /* 智力 ,根据智力可以获取更高级别的知识*/ intelligence = 0;

  PlayerAbility operator +(Object other) {
    if (other is! PlayerAbility) {
      return this;
    }

    return PlayerAbility()
      ..endurance = endurance + other.endurance
      ..attunement = attunement + other.attunement
      ..strength = strength + other.strength
      ..dexterity = dexterity + other.dexterity
      ..intelligence = intelligence + other.intelligence
      ..vitality = vitality + other.vitality;
  }

  static PlayerAbility fromString(String s) {
    var list = s.split(";");
    PlayerAbility result = PlayerAbility()
      ..attunement = 0
      ..dexterity = 0
      ..endurance = 0
      ..intelligence = 0
      ..strength = 0
      ..vitality = 0;
    if (list.isEmpty) {
      return result;
    }

    for (final i in list) {
      final s = i.split("_");
      if (s.length != 2) {
        continue;
      }
      final name = s[0];
      final value = double.tryParse(s[1]) ?? 0;
      switch (name) {
        case "endurance":
          result.endurance = value;
          break;
        case "vitality":
          result.vitality = value;
          break;
        case "attunement":
          result.attunement = value;
          break;
        case "strength":
          result.strength = value;
          break;
        case "dexterity":
          result.dexterity = value;
          break;
        case "intelligence":
          result.intelligence = value;
          break;
      }
    }

    return result;
  }
}

extension ToChartA on PlayerAbility {
  Widget toChart() {
    var features = ["End", "Vit", "Att", "Str", "Dex", "Int"];

    var data = [
      endurance,
      vitality,
      attunement,
      strength,
      dexterity,
      intelligence,
    ];
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: RadarChart.light(ticks: ticks, features: features, data: [data]),
      ),
    );
  }
}

/// max 100; min 0
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

  PlayerKnowledge operator +(Object other) {
    if (other is! PlayerKnowledge) {
      return this;
    }

    return PlayerKnowledge()
      ..math = math + other.math
      ..language = language + other.language
      ..history = history + other.history
      ..geography = geography + other.geography
      ..chemistry = chemistry + other.chemistry
      ..biography = biography + other.biography
      ..it = it + other.it
      ..physics = physics + other.physics;
  }

  static PlayerKnowledge fromString(String s) {
    var list = s.split(";");
    PlayerKnowledge result = PlayerKnowledge()
      ..math = 0
      ..language = 0
      ..history = 0
      ..geography = 0
      ..chemistry = 0
      ..biography = 0
      ..it = 0
      ..physics = 0;

    if (list.isEmpty) {
      return result;
    }

    for (final i in list) {
      final s = i.split("_");
      if (s.length != 2) {
        continue;
      }
      final name = s[0];
      final value = double.tryParse(s[1]) ?? 0;
      switch (name) {
        case "math":
          result.math = value;
          break;
        case "language":
          result.language = value;
          break;
        case "history":
          result.history = value;
          break;
        case "geography":
          result.geography = value;
          break;
        case "chemistry":
          result.chemistry = value;
          break;
        case "biography":
          result.biography = value;
          break;
        case "it":
          result.it = value;
      }
    }
    return result;
  }
}

extension ToChartK on PlayerKnowledge {
  Widget toChart() {
    var features = ["Mat", "Lan", "His", "Geo", "Che", "Phy", "Bio", "IT"];

    var data = [
      math,
      language,
      history,
      geography,
      chemistry,
      physics,
      biography,
      it,
    ];
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: RadarChart.light(ticks: ticks, features: features, data: [data]),
      ),
    );
  }
}
