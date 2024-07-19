import 'package:flutter/material.dart';
import 'package:make_a_dream/game/models/base_quiz_model.dart';
import 'package:make_a_dream/game/models/character_quiz_model.dart';
import 'package:make_a_dream/i18n/strings.g.dart';

typedef OnClick = void Function(bool b);

class QuizSelectionDialog<T extends BaseQuizModel> extends StatelessWidget {
  const QuizSelectionDialog(
      {super.key,
      required this.quizModel,
      required this.onClick,
      this.expanded = false});
  final T? quizModel;
  final OnClick onClick;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: !expanded
            ? const EdgeInsets.all(10)
            : const EdgeInsets.only(top: 30, left: 10),
        child: quizModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: Text(
                      quizModel is CharacterQuizModel
                          ? Translations.of(context).quiz.question(
                              content:
                                  "${(quizModel! as CharacterQuizModel).quiz} ${quizModel!.question}")
                          : Translations.of(context)
                              .quiz
                              .question(content: quizModel!.question),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      itemBuilder: (c, i) {
                        return SizedBox(
                          height: 30,
                          child: InkWell(
                            onTap: () {
                              onClick(
                                  quizModel!.options[i] == quizModel!.answer);
                            },
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "${i + 1}. ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: quizModel!.options[i])
                            ])),
                          ),
                        );
                      },
                      itemCount: quizModel!.options.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
