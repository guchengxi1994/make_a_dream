import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:isar/isar.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';
import 'package:make_a_dream/isar/npc.dart';
import 'package:make_a_dream/isar/player_event.dart';
import 'dart:math' as m;

part 'player_record.g.dart';

@collection
class PlayerRecord {
  Id id = Isar.autoIncrement;
  int createAt = DateTime.now().millisecondsSinceEpoch;

  /// 头像路径
  String? avatar;

  /// 自定义名称
  late String name = "player";

  /// role path
  late String rolePath = "human2.png";

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

  IsarLinks<PlayerEvent> playerEvents = IsarLinks();

  LastPostition? lastPostition;
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

enum KnowledgeThreshold {
  /* 幼儿园 */ kindergarten(0, "学龄前"),
  /* 小学 */ elementarySchool(5, "小学"),
  /* 初中 */ middleSchool(10, "初中"),
  /* 高中 */ highSchool(20, "高中"),
  /* 大学 */ university(40, "大学"),
  /* 硕士 */ master(60, "硕士"),
  /* 博士 */ doctor(80, "博士"),
  /* 博士以上 */ doctorPlus(99, "博士以上");

  const KnowledgeThreshold(this.value, this.type);

  final int value;
  final String type;

  static String match(int v) {
    if (v >= KnowledgeThreshold.doctorPlus.value) {
      return KnowledgeThreshold.doctorPlus.type;
    } else if (v >= KnowledgeThreshold.doctor.value) {
      return KnowledgeThreshold.doctor.type;
    } else if (v >= KnowledgeThreshold.master.value) {
      return KnowledgeThreshold.master.type;
    } else if (v >= KnowledgeThreshold.university.value) {
      return KnowledgeThreshold.university.type;
    } else if (v >= KnowledgeThreshold.highSchool.value) {
      return KnowledgeThreshold.highSchool.type;
    } else if (v >= KnowledgeThreshold.middleSchool.value) {
      return KnowledgeThreshold.middleSchool.type;
    } else if (v >= KnowledgeThreshold.elementarySchool.value) {
      return KnowledgeThreshold.elementarySchool.type;
    } else {
      return KnowledgeThreshold.kindergarten.type;
    }
  }
}

/// max 10000; min 0
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

  String getKnowledgePrompt(
      {String teacherType = 'science teacher', String? his}) {
    String s = "你的学生基本情况如下:\n";
    if (teacherType == "science teacher") {
      s += "数学程度在${KnowledgeThreshold.match(expEval(math).floor())}左右；";
      s += "地理程度在${KnowledgeThreshold.match(expEval(geography).floor())}左右；";
      s += "化学程度在${KnowledgeThreshold.match(expEval(chemistry).floor())}左右；";
      s += "物理程度在${KnowledgeThreshold.match(expEval(physics).floor())}左右；";
      s += "生物程度在${KnowledgeThreshold.match(expEval(biography).floor())}左右；";
      s += "IT程度在${KnowledgeThreshold.match(expEval(it).floor())}左右。\n";
    } else {
      s += "文学程度在${KnowledgeThreshold.match(expEval(language).floor())}左右；";
      s += "历史程度在${KnowledgeThreshold.match(expEval(history).floor())}左右。\n";
    }

    s +=
        "请根据学生的能力，给一个相关领域的知识。注意：1.你的身份是一个老师，请以老师的口吻描述。2.只需要从中选择一个领域即可，不需要满足所有领域。\n";
    if (his == null) {
      s += "请尽情发挥。";
    } else {
      s += "以下内容已经教授过了，请尽量不要重复教授。内容如下: $his";
    }

    return s;
  }

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

double expEval(double v) {
  return 99 * (m.sqrt(v / 10000));
}

@embedded
class LastPostition {
  late String routeName = GameInitialRoute.routeName;
  int createAt = DateTime.now().millisecondsSinceEpoch;
  late double x = 0;
  late double y = 0;
}
