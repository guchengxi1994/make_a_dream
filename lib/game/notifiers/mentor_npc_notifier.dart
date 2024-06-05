import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/opening_page/notifiers/player_notifier.dart';

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
    final mentor = aiClient.model.npcs.where((v) => v.name == "mentor").first;

    final stream = aiClient.stream([
      ...aiClient.systemMessages,
      SystemChatMessage(
          content: "玩家的名字是${ref.read(playerProvider).current?.name}"),
      ChatMessage.system(mentor.role),
      ChatMessage.humanText("请介绍一下游戏内容。")
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
