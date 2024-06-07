import 'package:bonfire/bonfire.dart';
import 'package:bonfire/map/base/layer.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/mentor_talk_dialog.dart';
import 'package:make_a_dream/game/notifiers/mentor_npc_state.dart';

import 'package:make_a_dream/game/util.dart';
import 'package:make_a_dream/isar/npc.dart';

class MentorNpc extends SimpleNpc {
  MentorNpc({required super.size, required this.state})
      : super(
            animation: PersonSpritesheet(path: "mentor.png").simpleAnimation(),
            speed: 0,
            initDirection: Direction.down,
            position: Vector2(tileSize * state.plot.position[0],
                tileSize * state.plot.position[1]));

  final MentorNpcState state;

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
  void onMount() {
    super.onMount();
    if (state.npc.stage != NpcStage.unknow) {
      final entry =
          gameRef.map.layers.where((v) => v.name == "entry").firstOrNull;
      if (entry != null) {
        final layers = List<Layer>.from(gameRef.map.layers);
        final entryCopy = Layer(
            id: entry.id,
            tiles: entry.tiles,
            name: entry.name,
            layerClass: entry.layerClass,
            visible: true,
            position: entry.position,
            offset: entry.offset,
            opacity: 1,
            properties: entry.properties,
            priority: entry.priority);
        layers.removeWhere((v) => v.id == entry.id);

        layers.add(entryCopy);

        gameRef.map.updateLayers(layers);
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // print("update");

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
        }).then((_) {
      // print(gameRef.player!.position);
      // gameRef.player!.moveToPosition(Vector2(0, 10));
      // gameRef.player!.translate(
      //   Vector2(0, 10),
      // );
      _movePlayerToTarget();
      isInDialog = false;
      for (final i in gameRef.map.layers) {
        print("${i.name}   ${i.opacity}");
      }
    });
  }

  /// [moveToPosition] 方法有点问题，达不到
  /// 移动人物的目的，只能用 [translate]
  _movePlayerToTarget() {
    final current = gameRef.player!.position;
    final target = Vector2(tileSize * state.plot.position[0],
        tileSize * (state.plot.position[1] + 1));
    final trans = Vector2(target.x - current.x, target.y - current.y);
    gameRef.player!.translate(
      trans,
    );
  }
}
