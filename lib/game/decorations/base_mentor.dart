import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/base_mentor_dialog.dart';
import 'package:make_a_dream/game/notifiers/base_mentor_notifier.dart';
import 'package:make_a_dream/game/notifiers/player_notifier.dart';

import 'decoration_mixin.dart';

class BaseMentor extends GameDecoration with Sensor<Player>, DecorationMixin {
  BaseMentor({
    required super.position,
    required super.size,
    required this.mentorName,
    required this.path,
    required this.ref,
    this.srcPosition = (0, 0),
    this.srcSize = (32, 48),
  }) : super.withSprite(
          sprite: Sprite.load(path,
              srcPosition: Vector2(srcPosition.$1, srcPosition.$2),
              srcSize: Vector2(srcSize.$1, srcSize.$2)),
        );
  final String mentorName;
  final String path;
  final WidgetRef ref;
  final (double, double) srcPosition;
  final (double, double) srcSize;

  bool isTouched = false;

  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();

      if (mentorName != "writer") {
        final history =
            ref.read(baseMentorProvider(mentorName).notifier).getHistory();
        showGeneralDialog(
            barrierLabel: "mentor",
            barrierDismissible: true,
            context: context,
            barrierColor: Colors.transparent,
            pageBuilder: (c, _, __) {
              return Center(
                child: BaseMentorDialog(
                  mentorName: mentorName,
                  prompt: ref
                      .read(playerProvider)
                      .current!
                      .knowledge
                      .getKnowledgePrompt(
                          teacherType: mentorName,
                          his: history.isNotEmpty ? history.join(";") : null),
                ),
              );
            });
      } else {
        final history =
            ref.read(baseMentorProvider(mentorName).notifier).getAllHistory();
        showGeneralDialog(
            barrierLabel: "writer",
            barrierDismissible: true,
            context: context,
            barrierColor: Colors.transparent,
            pageBuilder: (c, _, __) {
              return Center(
                child: BaseMentorDialog(
                  mentorName: mentorName,
                  prompt: """
以下是前情提要。
$history

你会根据已经完成的故事，续写200字左右的内容。注意：1.结果中只需要返回续写的内容，不要返回任何多余的内容。
2.续写的故事需要有章节结构，每次只生成一个章节内容，章节有顺序结构，请按照章节顺序合理进行续写。
3.章节标题用markdown加粗标记。
""",
                ),
              );
            });
      }
    }
    updatePosition(ref, position);
    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
