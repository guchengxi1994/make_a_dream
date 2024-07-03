import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:isar/isar.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/game/models/achievement_model.dart';
import 'package:make_a_dream/game/models/game_model.dart';
import 'package:make_a_dream/game/models/plot_model.dart';
import 'package:make_a_dream/game/models/role_quiz_model.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:make_a_dream/isar/npc.dart' as n;
import 'package:make_a_dream/isar/player_record.dart';

class AiClient {
  AiClient._();

  static final _instance = AiClient._();

  factory AiClient() => _instance;
  late GameModel model;
  late Plots plots;
  late AchievementsList achievementsList;
  late IsarDatabase database = IsarDatabase();
  late RoleQuizModel roleQuizModel;

  getAvatarByName(String name) {
    return model.npcs.firstWhere((element) => element.name == name).avatar;
  }

  initGameModel(String path) {
    File file = File(path);
    model = GameModel.fromJson(jsonDecode(file.readAsStringSync()));
  }

  initPlot(String path) {
    File file = File(path);
    plots = Plots.fromJson(jsonDecode(file.readAsStringSync()));
  }

  initAchievements(String path) {
    File file = File(path);
    achievementsList =
        AchievementsList.fromJson(jsonDecode(file.readAsStringSync()));
  }

  initQuiz(String path) {
    File file = File(path);
    roleQuizModel = RoleQuizModel.fromJson(jsonDecode(file.readAsStringSync()));
  }

  initOpenAi(String path) {
    OpenaiClient.fromEnv(path);
  }

  Future initialAllNpcs(int playerId) async {
    await database.isar!.writeTxn(() async {
      final List<n.Npc> npcs = [];
      for (final i in plots.plots) {
        final npc = n.Npc()..name = i.npc;
        npcs.add(npc);
      }
      final player = await database.isar!.playerRecords
          .where()
          .idEqualTo(playerId)
          .findFirst();

      await database.isar!.npcs.putAll(npcs);
      player!.npcs.addAll(npcs);
      await player.npcs.save();
    });
  }

  late final List<SystemChatMessage> systemMessages = [
    SystemChatMessage(content: model.story),
    SystemChatMessage(content: model.gameSystem),
  ];

  Stream<ChatResult> stream(List<ChatMessage> history,
      {String tag = "text-model"}) {
    final client = OpenaiClient.getByTag(tag);
    return client!.stream(history);
  }
}
