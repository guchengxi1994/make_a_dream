import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/mentor_talk_dialog.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';
import 'package:make_a_dream/game/maps/multiple_map_notifier.dart';
import 'package:make_a_dream/game/notifiers/mentor_npc_notifier.dart';

import 'package:make_a_dream/game/util.dart';

class MentorNpc extends SimpleNpc {
  MentorNpc({required super.size, required this.ref})
      : super(
            animation: PersonSpritesheet(path: "mentor.png").simpleAnimation(),
            speed: 0,
            initDirection: Direction.down,
            position: Vector2(
                tileSize * ref.read(mentorProvider).plot.position[0],
                tileSize * ref.read(mentorProvider).plot.position[1]));

  final WidgetRef ref;

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

    // print("update");

    if (gameRef.player != null &&
        gameRef.player!.position.distanceTo(position) < 10 &&
        !isInDialog &&
        ref.read(multipleMapProvider) == GameInitialRoute.routeName) {
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
        }).then((_) {
      // print(gameRef.player!.position);
      // gameRef.player!.moveToPosition(Vector2(tileSize * 4, tileSize * 5));
      // gameRef.player!.translate(
      //   Vector2(0, 10),
      // );
      _movePlayerToTarget();
      isInDialog = false;
    });
  }

  /// [moveToPosition] 方法有点问题，达不到
  /// 移动人物的目的，只能用 [translate]
  _movePlayerToTarget() {
    final current = gameRef.player!.position;
    final target = Vector2(tileSize * ref.read(mentorProvider).plot.position[0],
        tileSize * (ref.read(mentorProvider).plot.position[1] + 1));
    final trans = Vector2(target.x - current.x, target.y - current.y);
    gameRef.player!.translate(
      trans,
    );
  }
}
