import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/mentor_talk_dialog.dart';

import 'package:make_a_dream/game/util.dart';

class MentorNpc extends SimpleNpc {
  MentorNpc({required super.position, required super.size})
      : super(
            animation: PersonSpritesheet(path: "mentor.png").simpleAnimation(),
            speed: 0,
            initDirection: Direction.down);

  bool isInDialog = false;

  late final TextPaint _textConfig = TextPaint(
    style: TextStyle(color: Colors.white, fontSize: width / 4),
  );

  double xCenter = 0;
  double yCenter = 0;

  @override
  Future<void> onLoad() {
    String text = "mentor";
    final textSize = _textConfig.getLineMetrics(text).size;
    xCenter = (width - textSize.x) / 2;
    yCenter = (height - textSize.y) / 2;
    add(
      TextComponent(
        text: text,
        position: Vector2(xCenter, -0.5 * yCenter),
        textRenderer: _textConfig,
      ),
    );

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.player != null &&
        gameRef.player!.position.distanceTo(position) < 10 &&
        !isInDialog) {
      moveToPosition(gameRef.player!.position);

      gameRef.player!.stopMove();
      _showTalk();
      isInDialog = true;
    }
  }

  void _showTalk() {
    showGeneralDialog(
        context: context,
        barrierColor: Colors.transparent,
        pageBuilder: (c, _, __) {
          return const Center(
            child: MentorTalkDialog(),
          );
        });
  }
}
