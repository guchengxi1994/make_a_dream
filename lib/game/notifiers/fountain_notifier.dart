// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:make_a_dream/isar/npc.dart';
import 'package:make_a_dream/isar/player_record.dart';
import 'package:make_a_dream/game/notifiers/player_notifier.dart';

import 'fountain_state.dart';

class FountainNotifier extends AutoDisposeNotifier<FountainState> {
  static const role = "fountain";

  final AiClient aiClient = AiClient();
  final IsarDatabase isarDatabase = IsarDatabase();
  final ScrollController controller = ScrollController();
  @override
  FountainState build() {
    final playerId = ref.read(playerProvider).current!.id;
    final npc = isarDatabase.isar!.playerRecords
        .where()
        .idEqualTo(playerId)
        .findFirstSync()!
        .npcs
        .where((v) => v.name == role)
        .first;
    final fountain = aiClient.model.npcs.where((v) => v.name == role).first;
    final plot = aiClient.plots.plots
        .where(
          (element) => element.npc == role,
        )
        .first;

    return FountainState(
        plot: plot,
        role: fountain.role,
        npc: npc,
        dialog: "",
        conversationDone: false);
  }

  Future<void> plot(String wish) async {
    final couldDo = await ref.read(playerProvider.notifier).couldDo();
    if (!couldDo) {
      state =
          state.copyWith(conversationDone: true, dialog: "Up to limit today");

      return;
    }

    final stream = aiClient.stream([
      ChatMessage.system(state.role),
      ChatMessage.humanText("用户许了一个愿望，希望$wish。你因为是一个美好的愿望而献上了最美好的祝福。")
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

        await isarDatabase.isar!.writeTxn(() async {
          await isarDatabase.isar!.npcs.put(_npc);
          await player.npcs.save();
          await isarDatabase.isar!.playerRecords.put(player);
        });

        ref.read(playerProvider.notifier).changeCurrent(player);
        state = state.copyWith(conversationDone: true);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
    );
  }
}

final fountainProvider =
    AutoDisposeNotifierProvider<FountainNotifier, FountainState>(
        () => FountainNotifier());
