import 'package:flutter/material.dart';
import 'package:make_a_dream/game/models/quiz_model.dart';

typedef OnClick = void Function(bool b);

class QuizSelectionDialog extends StatelessWidget {
  const QuizSelectionDialog(
      {super.key, required this.quizModel, required this.onClick});
  final QuizModel? quizModel;
  final OnClick onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: quizModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Text(
                      "问题如下:${quizModel!.question}",
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
