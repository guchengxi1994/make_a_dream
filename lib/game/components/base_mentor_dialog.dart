// ignore_for_file: avoid_init_to_null

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/common/logger_utils.dart';
import 'package:make_a_dream/game/components/quiz_selection_dialog.dart';
import 'package:make_a_dream/game/components/talk_mixin.dart';
import 'package:make_a_dream/game/models/quiz_model.dart';
import 'package:make_a_dream/game/notifiers/base_mentor_notifier.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/i18n/strings.g.dart';
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

    logger.info("prompt ${widget.prompt}");

    if (talked && widget.mentorName != "writer") {
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
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
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
                      color: Colors.transparent,
                      // border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(20),
                      image: isExpanded
                          ? const DecorationImage(
                              image: AssetImage("assets/bg/info_base.png"),
                              fit: BoxFit.fill)
                          : const DecorationImage(
                              image: AssetImage("assets/bg/plate_bright.png"),
                              fit: BoxFit.fitWidth)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: isExpanded
                            ? const EdgeInsets.only(top: 100)
                            : const EdgeInsets.all(1),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: NpcAvatarWidget(
                            avatar: aiClient.getAvatarByName(state.npc.name),
                            name: state.npc.name,
                          ),
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
                                    expanded: isExpanded,
                                    quizModel: quizModel,
                                    onClick: (b) {
                                      logger.info(
                                          "quizModel ${quizModel!.quizType}");
                                      talked = false;
                                      if (b) {
                                        ref
                                            .read(baseMentorProvider(
                                                    widget.mentorName)
                                                .notifier)
                                            .simplePlot("回答正确。");
                                        late PlayerKnowledge knowledge;
                                        switch (quizModel.quizType) {
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
                                            .simplePlot(Translations.of(context)
                                                .gaoshi
                                                .error(
                                                    content:
                                                        "**${quizModel.answer}**"));
                                        addLikability(-1, widget.mentorName);
                                      }
                                    })
                                : Padding(
                                    padding: isExpanded
                                        ? const EdgeInsets.only(
                                            top: 100, right: 30)
                                        : const EdgeInsets.all(1),
                                    child: MarkdownBlock(
                                      data: state.dialog,
                                      selectable: false,
                                      config: MarkdownConfig.defaultConfig,
                                    ),
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
                                          ? const Icon(Icons.expand_more,
                                              color: Colors.white)
                                          : const Icon(Icons.expand_less,
                                              color: Colors.white)),
                                  if (!talked || widget.mentorName == "writer")
                                    TextButton(
                                        autofocus: true,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Got it",
                                          style: TextStyle(color: Colors.white),
                                        ))
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
