// ignore_for_file: avoid_init_to_null

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/quiz_selection_dialog.dart';
import 'package:make_a_dream/game/components/talk_mixin.dart';
import 'package:make_a_dream/game/models/quiz_model.dart';
import 'package:make_a_dream/game/notifiers/base_mentor_notifier.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/isar/player_record.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'avatar_widget.dart';

class BaseMentorDialog extends ConsumerStatefulWidget {
  const BaseMentorDialog(
      {super.key, required this.mentorName, this.prompt = ""});
  final String mentorName;
  final String prompt;

  @override
  ConsumerState<BaseMentorDialog> createState() => _BaseMentorState();
}

class _BaseMentorState extends ConsumerState<BaseMentorDialog> with TalkMixin {
  final AiClient aiClient = AiClient();
  final TextEditingController controller = TextEditingController();

  bool isAnswering = false;
  late bool talked =
      ref.read(baseMentorProvider(widget.mentorName).notifier).talked;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    if (talked) {
      ref.read(baseMentorProvider(widget.mentorName).notifier).plotQuiz();
    } else {
      ref
          .read(baseMentorProvider(widget.mentorName).notifier)
          .plot(humanMessage: widget.prompt);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseMentorProvider(widget.mentorName));

    QuizModel? quizModel = null;
    try {
      quizModel = QuizModel.fromJson(jsonDecode(
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
                                .read(baseMentorProvider(widget.mentorName)
                                    .notifier)
                                .controller,
                            child: talked && quizModel != null
                                ? QuizSelectionDialog(
                                    quizModel: quizModel,
                                    onClick: (b) {
                                      talked = false;
                                      if (b) {
                                        ref
                                            .read(baseMentorProvider(
                                                    widget.mentorName)
                                                .notifier)
                                            .simplePlot("回答正确。");
                                        late PlayerKnowledge knowledge;
                                        switch (quizModel!.quizType) {
                                          case "文学":
                                            knowledge = PlayerKnowledge()
                                              ..language = 1;
                                            break;
                                          case "数学":
                                            knowledge = PlayerKnowledge()
                                              ..math = 1;
                                            break;
                                          case "历史":
                                            knowledge = PlayerKnowledge()
                                              ..history = 1;
                                            break;
                                          case "地理":
                                            knowledge = PlayerKnowledge()
                                              ..geography = 1;
                                            break;
                                          case "化学":
                                            knowledge = PlayerKnowledge()
                                              ..chemistry = 1;
                                            break;
                                          case "物理":
                                            knowledge = PlayerKnowledge()
                                              ..physics = 1;
                                            break;
                                          case "生物":
                                            knowledge = PlayerKnowledge()
                                              ..biography = 1;
                                            break;
                                          case "IT":
                                            knowledge = PlayerKnowledge()
                                              ..it = 1;
                                            break;
                                          default:
                                            knowledge = PlayerKnowledge();
                                        }

                                        addKnowledge(knowledge);
                                        addLikability(1, widget.mentorName);
                                      } else {
                                        ref
                                            .read(baseMentorProvider(
                                                    widget.mentorName)
                                                .notifier)
                                            .simplePlot(
                                                "回答错误。答案应该是**${quizModel?.answer}**");
                                        addLikability(-1, widget.mentorName);
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
                                  if (!talked)
                                    TextButton(
                                        autofocus: true,
                                        onPressed: () {
                                          Navigator.of(context).pop();
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
