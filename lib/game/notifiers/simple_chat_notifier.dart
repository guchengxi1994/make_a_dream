import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain_lib/langchain_lib.dart';
import 'package:make_a_dream/game/notifiers/simple_chat_state.dart';
import 'package:make_a_dream/global/ai_client.dart';

import 'player_notifier.dart';

class SimpleChatNotifier
    extends AutoDisposeFamilyNotifier<SimpleChatState, String> {
  final ScrollController controller = ScrollController();
  final AiClient aiClient = AiClient();

  @override
  SimpleChatState build(String arg) {
    return SimpleChatState(conversationDone: false, dialog: "");
  }

  Future<void> plot({required String humanMessage}) async {
    final couldDo = await ref.read(playerProvider.notifier).couldDo();
    if (!couldDo || humanMessage == "") {
      state =
          state.copyWith(conversationDone: true, dialog: "Up to limit today");

      return;
    }

    // final talked = ref.read(playerProvider.notifier).talkedToday(arg);

    final stream = aiClient.stream([
      ChatMessage.humanText(humanMessage),
    ]);

    stream.listen(
      (v) {
        state = state.copyWith(dialog: state.dialog + v.outputAsString);
        controller.jumpTo(controller.position.maxScrollExtent);
      },
      onDone: () async {
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

final simpleChatProvider = AutoDisposeNotifierProvider.family<
    SimpleChatNotifier, SimpleChatState, String>(() => SimpleChatNotifier());
