import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/models/role_quiz_model.dart';
import 'package:make_a_dream/isar/player_record.dart';
import 'package:make_a_dream/opening_page/notifiers/create_player_notifier.dart';

class QuizBuilder {
  final RoleQuizModel model;

  QuizBuilder({required this.model});

  List<Widget> build() {
    List<Widget> widgets = [];

    for (final i in model.quiz) {
      widgets.add(QuizWidget(
        quiz: i,
        isLast: model.quiz.length == i.id,
      ));
    }

    return widgets;
  }
}

class QuizWidget extends ConsumerStatefulWidget {
  const QuizWidget({
    super.key,
    required this.quiz,
    required this.isLast,
  });
  final Quiz quiz;
  final bool isLast;

  @override
  ConsumerState<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends ConsumerState<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Center(
              child: Text(widget.quiz.question),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (c, i) {
              return QuizButton(
                  option: widget.quiz.options[i],
                  onInvokeCallback: (c) {
                    PlayerAbility ability = PlayerAbility.fromString(c.result);
                    PlayerKnowledge knowledge =
                        PlayerKnowledge.fromString(c.result);

                    ref.read(createPlayerProvider.notifier).addAbility(ability);
                    ref
                        .read(createPlayerProvider.notifier)
                        .addKnowledge(knowledge);

                    if (widget.isLast) {
                      Navigator.of(context).pop(ref.read(createPlayerProvider));
                    } else {
                      ref.read(createPlayerProvider.notifier).animateTo(
                            widget.quiz.id + 1,
                          );
                    }
                  });
            },
            itemCount: widget.quiz.options.length,
          ))
        ],
      ),
    );
  }
}

typedef OnInvokeCallback = void Function(Option option);

class QuizButton extends StatefulWidget {
  const QuizButton(
      {super.key, required this.option, required this.onInvokeCallback});
  final Option option;
  final OnInvokeCallback onInvokeCallback;

  @override
  State<QuizButton> createState() => _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          onHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          onHover = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          widget.onInvokeCallback(widget.option);
        },
        child: Container(
          decoration: BoxDecoration(
              color: onHover ? Colors.lightBlue : Colors.grey[200],
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.only(top: 10),
          width: 200,
          height: 50,
          child: Center(
            child: Text(widget.option.text),
          ),
        ),
      ),
    );
  }
}
