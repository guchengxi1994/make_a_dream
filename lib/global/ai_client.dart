import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/game/models/achievement_model.dart';
import 'package:make_a_dream/game/models/game_model.dart';
import 'package:make_a_dream/game/models/plot_model.dart';

class AiClient {
  AiClient._();

  static final _instance = AiClient._();

  factory AiClient() => _instance;
  late GameModel model;
  late Plots plots;
  late AchievementsList achievementsList;

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

  initOpenAi(String path) {
    OpenaiClient.fromEnv(path);
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
