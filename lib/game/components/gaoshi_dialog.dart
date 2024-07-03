// ignore_for_file: avoid_init_to_null

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/avatar_widget.dart';
import 'package:make_a_dream/game/components/quiz_selection_dialog.dart';
import 'package:make_a_dream/game/models/character_quiz_model.dart';
import 'package:make_a_dream/game/notifiers/base_mentor_notifier.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:markdown_widget/markdown_widget.dart';

class GaoshiDialog extends ConsumerStatefulWidget {
  const GaoshiDialog({super.key, required this.npcName, this.prompt = ""});
  final String npcName;
  final String prompt;

  @override
  ConsumerState<GaoshiDialog> createState() => _GaoshiDialogState();
}

class _GaoshiDialogState extends ConsumerState<GaoshiDialog> {
  bool isExpanded = false;
  final AiClient aiClient = AiClient();
  final IsarDatabase isarDatabase = IsarDatabase();
  final ScrollController controller = ScrollController();

  bool correct = false;

  @override
  void initState() {
    super.initState();
    ref
        .read(baseMentorProvider(widget.npcName).notifier)
        .plot(humanMessage: widget.prompt);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseMentorProvider(widget.npcName));
    CharacterQuizModel? quizModel = null;
    try {
      quizModel = CharacterQuizModel.fromJson(jsonDecode(
          state.dialog.replaceAll("```json", "").replaceAll("```", "")));
    } catch (_) {}

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            const SizedBox.expand(),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  height: isExpanded
                      ? MediaQuery.of(context).size.height * 0.8
                      : 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: NpcAvatarWidget(
                          avatar: aiClient.getAvatarByName(state.npc.name),
                          name: state.npc.name,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                            controller: ref
                                .read(
                                    baseMentorProvider(widget.npcName).notifier)
                                .controller,
                            child: quizModel != null
                                ? QuizSelectionDialog(
                                    quizModel: quizModel,
                                    onClick: (b) {
                                      correct = b;
                                      if (b) {
                                        ref
                                            .read(baseMentorProvider(
                                                    widget.npcName)
                                                .notifier)
                                            .simplePlot(quizModel!.reason);
                                      } else {
                                        ref
                                            .read(baseMentorProvider(
                                                    widget.npcName)
                                                .notifier)
                                            .simplePlot(
                                                "回答错误.\n${quizModel!.reason}");
                                      }
                                    })
                                : MarkdownBlock(
                                    data: state.dialog,
                                    selectable: false,
                                    config: MarkdownConfig.defaultConfig,
                                  ),
                          )),
                          if (state.conversationDone && state.dialog != "")
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  TextButton(
                                      autofocus: true,
                                      onPressed: () {
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                      child: isExpanded
                                          ? const Icon(Icons.expand_more)
                                          : const Icon(Icons.expand_less)),
                                  TextButton(
                                      autofocus: true,
                                      onPressed: () {
                                        Navigator.of(context).pop(correct);
                                      },
                                      child: const Text("Got it"))
                                ],
                              ),
                            )
                        ],
                      ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
