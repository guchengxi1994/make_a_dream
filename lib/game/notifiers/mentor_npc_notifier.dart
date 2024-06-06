import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:make_a_dream/isar/npc.dart';
import 'package:make_a_dream/opening_page/notifiers/player_notifier.dart';

import 'mentor_npc_state.dart';

class MentorNpcNotifier extends AutoDisposeNotifier<MentorNpcState> {
  final AiClient aiClient = AiClient();
  final ScrollController controller = ScrollController();
  final IsarDatabase isarDatabase = IsarDatabase();

  @override
  MentorNpcState build() {
    final mentor = aiClient.model.npcs.where((v) => v.name == "mentor").first;
    final plot = aiClient.plots.plots
        .where(
          (element) => element.npc == "mentor",
        )
        .first;
    return MentorNpcState(name: "mentor", plot: plot, role: mentor.role);
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
        state = state.copyWith(dialog: state.dialog + v.outputAsString);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
      onDone: () {
        /// TODO 这里要存一份对话数据
        state = state.copyWith(npcStage: NpcStage.meet, conversationDone: true);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
    );
  }

  void resetDialog() {
    state = state.copyWith(dialog: "", conversationDone: false);
  }

  void talk() {
    /// TODO 这里要存一份对话数据
    state = state.copyWith(
        dialog:
            "what can I help you ${ref.read(playerProvider).current!.name}?",
        conversationDone: true);
  }
}

final mentorProvider =
    AutoDisposeNotifierProvider<MentorNpcNotifier, MentorNpcState>(
  () => MentorNpcNotifier(),
);
