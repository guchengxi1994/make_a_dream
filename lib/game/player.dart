import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/util.dart';
import 'package:make_a_dream/isar/player_record.dart';

class SinglePlayer extends SimplePlayer with BlockMovementCollision {
  SinglePlayer(
      {required super.position,
      required this.record,
      this.playerSize = const (12, 12)})
      : super(
            animation:
                PersonSpritesheet(path: record.rolePath).simpleAnimation(),
            size: Vector2(playerSize.$1, playerSize.$2),
            speed: record.ability.dexterity,
            initDirection: Direction.up);

  late final TextPaint _textConfig = TextPaint(
    style: TextStyle(color: Colors.white, fontSize: width / 4),
  );

  final (double, double) playerSize;

  double xCenter = 0;
  double yCenter = 0;

  // String text = "You";
  final PlayerRecord record;
  @override
  Future<void> onLoad() {
    final textSize = _textConfig.getLineMetrics(record.name).size;
    xCenter = (width - textSize.x) / 2;
    yCenter = (height - textSize.y) / 2;
    TextComponent textComponent = TextComponent(
      text: record.name,
      position: Vector2(xCenter, 2.5 * yCenter),
      textRenderer: _textConfig,
    );
    add(
      textComponent,
    );
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }

  @override
  void onMove(
      double speed, Vector2 displacement, Direction direction, double angle) {
    super.onMove(speed, displacement, direction, angle);
    gameRef.player!.speed = record.ability.dexterity;
    removeWhere((v) => v is TextComponent && v.text == record.name);

    // print("current ${position}");
  }
}

class SelectPlayer extends SimplePlayer {
  SelectPlayer(
      {required super.position,
      this.path = "human2.png",
      this.direction = Direction.down})
      : super(
            animation: PersonSpritesheet(path: path).simpleAnimation(),
            size: Vector2.all(16),
            speed: 0,
            initDirection: direction);

  final String path;
  final Direction direction;

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }
}
