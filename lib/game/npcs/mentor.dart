import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/mentor_talk_dialog.dart';

import 'package:make_a_dream/game/util.dart';

class MentorNpc extends SimpleNpc {
  MentorNpc({required super.position, required super.size})
      : super(
            animation: PersonSpritesheet(path: "mentor.png").simpleAnimation(),
            speed: 0);

  bool isInDialog = false;

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: size / 4, position: size / 4));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.player != null &&
        gameRef.player!.position.distanceTo(position) < 10) {
      if (!isInDialog) {
        gameRef.player!.stopMove();
        _showTalk();
        isInDialog = true;
      }
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
