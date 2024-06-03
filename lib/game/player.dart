import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/util.dart';

class SinglePlayer extends SimplePlayer with BlockMovementCollision {
  SinglePlayer({
    required super.position,
  }) : super(
            animation: PersonSpritesheet().simpleAnimation(),
            size: Vector2.all(24),
            speed: 32,
            initDirection: Direction.up);

  late final TextPaint _textConfig = TextPaint(
    style: TextStyle(color: Colors.white, fontSize: width / 4),
  );

  double xCenter = 0;
  double yCenter = 0;

  String text = "You";
  @override
  Future<void> onLoad() {
    final textSize = _textConfig.getLineMetrics(text).size;
    xCenter = (width - textSize.x) / 2;
    yCenter = (height - textSize.y) / 2;
    TextComponent textComponent = TextComponent(
      text: text,
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
    removeWhere((v) => v is TextComponent && v.text == text);
  }
}
