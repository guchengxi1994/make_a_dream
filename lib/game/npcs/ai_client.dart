import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/game/models/game_model.dart';

class AiClient {
  AiClient._();

  static final _instance = AiClient._();

  factory AiClient() => _instance;
  late GameModel model;

  initGameModel(String path) {
    File file = File(path);
    model = GameModel.fromJson(jsonDecode(file.readAsStringSync()));
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
