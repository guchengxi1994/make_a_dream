// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/game/notifiers/fes_state.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:make_a_dream/isar/npc.dart';
import 'package:make_a_dream/isar/player_event.dart';
import 'package:make_a_dream/isar/player_record.dart';

import 'player_notifier.dart';

class FesNotifier extends AutoDisposeNotifier<FesState> {
  static const role = "fes";

  final AiClient aiClient = AiClient();
  final IsarDatabase isarDatabase = IsarDatabase();
  final ScrollController controller = ScrollController();

  @override
  FesState build() {
    final playerId = ref.read(playerProvider).current!.id;
    final npc = isarDatabase.isar!.playerRecords
        .where()
        .idEqualTo(playerId)
        .findFirstSync()!
        .npcs
        .where((v) => v.name == role)
        .first;
    final fes = aiClient.model.npcs.where((v) => v.name == role).first;
    final plot = aiClient.plots.plots
        .where(
          (element) => element.npc == role,
        )
        .first;

    return FesState(
        plot: plot,
        role: fes.role,
        npc: npc,
        dialog: "",
        conversationDone: false);
  }

  Future<void> plot() async {
    final couldDo = await ref.read(playerProvider.notifier).couldDo();
    if (!couldDo) {
      state =
          state.copyWith(conversationDone: true, dialog: "Up to limit today");

      return;
    }

    DateTime now = DateTime.now();

    final stream = aiClient.stream([
      ChatMessage.system(state.role),
      ChatMessage.humanText(
          "今天是${now.year}年${now.month}月${now.day}，请问今天是什么特殊节日吗？如果有的话，请用简单的文字描述一下典故或者节日来历。")
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

        final _npc = player.npcs.where((v) => v.name == role).first;
        _npc.history = List.from(_npc.history)
          ..add(History()
            ..content = state.dialog
            ..type = HistoryType.npc);

        _npc.stage = NpcStage.meet;
        PlayerEvent playerEvent = PlayerEvent()
          ..playerEventType = PlayerEventType.talk
          ..withWhom = role;

        await isarDatabase.isar!.writeTxn(() async {
          await isarDatabase.isar!.npcs.put(_npc);
          await isarDatabase.isar!.playerEvents.put(playerEvent);
          player.playerEvents.add(playerEvent);
          await player.npcs.save();
          await player.playerEvents.save();
          await isarDatabase.isar!.playerRecords.put(player);
        });

        ref.read(playerProvider.notifier).changeCurrent(player);
        state = state.copyWith(conversationDone: true);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
      onError: (e) {
        state = state.copyWith(
            dialog: state.dialog + e.toString(), conversationDone: true);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
    );
  }
}

final fesProvider = AutoDisposeNotifierProvider<FesNotifier, FesState>(() {
  return FesNotifier();
});
