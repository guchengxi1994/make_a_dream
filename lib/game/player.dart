import 'package:bonfire/bonfire.dart';
import 'package:make_a_dream/game/util.dart';

class SinglePlayer extends SimplePlayer with BlockMovementCollision {
  SinglePlayer({
    required super.position,
  }) : super(
          animation: PersonSpritesheet().simpleAnimation(),
          size: Vector2.all(24),
          speed: 32,
        );

  @override
  Future<void> onLoad() {
    /// Adds rectangle collision
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }
}
