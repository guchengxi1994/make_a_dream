// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:make_a_dream/isar/npc.dart';
import 'package:make_a_dream/isar/player_record.dart';
import 'package:make_a_dream/opening_page/notifiers/player_notifier.dart';

import 'mentor_npc_state.dart';

class MentorNpcNotifier extends AutoDisposeNotifier<MentorNpcState> {
  final AiClient aiClient = AiClient();
  final ScrollController controller = ScrollController();
  final IsarDatabase isarDatabase = IsarDatabase();

  @override
  MentorNpcState build() {
    final playerId = ref.read(playerProvider).current!.id;

    final mentorState = isarDatabase.isar!.playerRecords
        .where()
        .idEqualTo(playerId)
        .findFirstSync()!
        .npcs
        .where((v) => v.name == "mentor")
        .first
        .stage;

    final mentor = aiClient.model.npcs.where((v) => v.name == "mentor").first;
    final plot = aiClient.plots.plots
        .where(
          (element) => element.npc == "mentor",
        )
        .first;
    return MentorNpcState(
        name: "mentor", plot: plot, role: mentor.role, npcStage: mentorState);
  }

  @Deprecated("use `plot` instead")
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
        state = state.copyWith(npcStage: NpcStage.meet, conversationDone: true);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
    );
  }

  void resetDialog() {
    state = state.copyWith(dialog: "", conversationDone: false);
  }

  @Deprecated("use `plot` instead")
  void talk() {
    state = state.copyWith(
        dialog:
            "what can I help you ${ref.read(playerProvider).current!.name}?",
        conversationDone: true);
  }

  void plot() {
    switch (state.npcStage) {
      case NpcStage.unknow:
        final stream = aiClient.stream([
          ...aiClient.systemMessages,
          SystemChatMessage(
              content: "玩家的名字是${ref.read(playerProvider).current?.name}"),
          ChatMessage.system(state.role),
          ChatMessage.humanText("请介绍一下游戏内容。")
        ]);

        stream.listen(
          (v) {
            state = state.copyWith(dialog: state.dialog + v.outputAsString);
            controller.jumpTo(controller.position.maxScrollExtent);
          },
          onDone: () async {
            /// TODO 这里要存一份对话数据

            final playerId = ref.read(playerProvider).current!.id;
            final player = isarDatabase.isar!.playerRecords
                .where()
                .idEqualTo(playerId)
                .findFirstSync()!;

            final _npc = player.npcs.where((v) => v.name == "mentor").first;
            _npc.history = List.from(_npc.history)
              ..add(History()
                ..content = state.dialog
                ..type = HistoryType.npc);

            _npc.stage = NpcStage.meet;

            await isarDatabase.isar!.writeTxn(() async {
              await isarDatabase.isar!.npcs.put(_npc);
              await player.npcs.save();
            });

            state =
                state.copyWith(npcStage: NpcStage.meet, conversationDone: true);
            controller.jumpTo(controller.position.maxScrollExtent);
          },
        );

        break;
      default:

        /// TODO 这里要存一份对话数据
        state = state.copyWith(
            dialog:
                "what can I help you ${ref.read(playerProvider).current!.name}?",
            conversationDone: true);
    }
  }
}

final mentorProvider =
    AutoDisposeNotifierProvider<MentorNpcNotifier, MentorNpcState>(
  () => MentorNpcNotifier(),
);
