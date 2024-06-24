import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/base_mentor_dialog.dart';

class BaseMentor extends GameDecoration with Sensor<Player> {
  BaseMentor(
      {required super.position,
      required super.size,
      required this.mentorName,
      required this.path})
      : super.withSprite(
          sprite: Sprite.load(path,
              srcPosition: Vector2(0, 0), srcSize: Vector2(32, 48)),
        );
  final String mentorName;
  final String path;

  bool isTouched = false;

  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();
      showGeneralDialog(
          barrierLabel: "mentor",
          barrierDismissible: true,
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (c, _, __) {
            return Center(
              child: BaseMentorDialog(
                mentorName: mentorName,
              ),
            );
          });
    }
    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
