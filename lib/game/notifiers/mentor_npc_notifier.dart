import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/game/npcs/ai_client.dart';

class MentorNpcNotifier extends AutoDisposeNotifier<(String, bool)> {
  final ScrollController controller = ScrollController();

  @override
  (String, bool) build() {
    return ("", false);
  }

  final AiClient aiClient = AiClient();

  reset() {
    state = ("", false);
  }

  void introduce() {
    final stream = aiClient.stream([
      ...aiClient.systemMessages,
      ChatMessage.system("你是这个游戏的制作人，会为玩家介绍一些简单的游戏功能。"),
      ChatMessage.humanText("很高兴第一次见到你,请问我要怎么做呢？")
    ]);

    stream.listen(
      (v) {
        state = (state.$1 + v.outputAsString, false);
        // print(state);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
      onDone: () {
        state = (state.$1, true);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
    );
  }
}

final mentorProvider =
    AutoDisposeNotifierProvider<MentorNpcNotifier, (String, bool)>(
  () => MentorNpcNotifier(),
);
