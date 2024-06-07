// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/common/toast_utils.dart';
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
    final npc = isarDatabase.isar!.playerRecords
        .where()
        .idEqualTo(playerId)
        .findFirstSync()!
        .npcs
        .where((v) => v.name == "mentor")
        .first;

    final mentor = aiClient.model.npcs.where((v) => v.name == "mentor").first;
    final plot = aiClient.plots.plots
        .where(
          (element) => element.npc == "mentor",
        )
        .first;
    return MentorNpcState(
      plot: plot,
      role: mentor.role,
      npc: npc,
    );
  }

  void resetDialog() {
    state = state.copyWith(dialog: "", conversationDone: false);
  }

  Future<void> plot() async {
    final _plot = aiClient.plots.plots.where((v) => v.npc == "mentor").first;

    if (state.npc.stage == NpcStage.unknow) {
      /// 未触发过对话，查找有没有 [introduce] 的节点
      final event = _plot.plot
          .where((v) => v.content == "introduce" && v.type == "once")
          .firstOrNull;
      if (event == null) {
        return;
      } else {
        /// 判定触发条件
        if (event.requirements.match(
            ref.read(playerProvider).current!.knowledge,
            ref.read(playerProvider).current!.ability,
            state.npc)) {
          /// 触发对话
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
              final playerId = ref.read(playerProvider).current!.id;
              final player = isarDatabase.isar!.playerRecords
                  .where()
                  .idEqualTo(playerId)
                  .findFirstSync()!;
              if (event.relatedAchievement != null) {
                /// 找到对应的 [achievement]
                final achievement = aiClient.achievementsList.achievements
                    .where((v) => v.id == event.relatedAchievement)
                    .firstOrNull;

                if (achievement != null) {
                  player.achievements = List.from(player.achievements)
                    ..add(Achievement()
                      ..description = achievement.description
                      ..name = achievement.name
                      ..iconPath = achievement.image);

                  ToastUtils.achievement(null, title: achievement.name);
                }
              }

              final _npc = player.npcs.where((v) => v.name == "mentor").first;
              _npc.history = List.from(_npc.history)
                ..add(History()
                  ..content = state.dialog
                  ..type = HistoryType.npc);

              _npc.stage = NpcStage.meet;

              await isarDatabase.isar!.writeTxn(() async {
                await isarDatabase.isar!.npcs.put(_npc);
                await player.npcs.save();
                await isarDatabase.isar!.playerRecords.put(player);
              });

              ref.read(playerProvider.notifier).changeCurrent(player);

              state = state.copyWith(
                  npcStage: NpcStage.meet, conversationDone: true);
              controller.jumpTo(controller.position.maxScrollExtent);
            },
          );
        }
      }
    } else {
      final playerId = ref.read(playerProvider).current!.id;
      final player = isarDatabase.isar!.playerRecords
          .where()
          .idEqualTo(playerId)
          .findFirstSync()!;

      final _npc = player.npcs.where((v) => v.name == "mentor").first;
      _npc.history = List.from(_npc.history)
        ..add(History()
          ..content = "what can I help you ${player.name}?"
          ..type = HistoryType.npc);

      await isarDatabase.isar!.writeTxn(() async {
        await isarDatabase.isar!.npcs.put(_npc);
        await player.npcs.save();
      });
      state = state.copyWith(
          dialog: "what can I help you ${player.name}?",
          conversationDone: true);
    }
  }

  addLikability(int i) {
    if (i == 0) {
      return;
    }

    /// TODO complete me
  }
}

final mentorProvider =
    AutoDisposeNotifierProvider<MentorNpcNotifier, MentorNpcState>(
  () => MentorNpcNotifier(),
);
