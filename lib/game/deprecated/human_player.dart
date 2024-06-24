import 'package:bonfire/bonfire.dart';
import 'package:make_a_dream/game/util.dart';

@Deprecated("for test")
class HumanPlayer extends SimplePlayer with BlockMovementCollision {
  HumanPlayer({
    required super.position,
  }) : super(
          animation: PersonSpritesheet().simpleAnimation(),
          size: Vector2.all(48),
          speed: 200,
        );

  @override
  Future<void> onLoad() {
    /// Adds rectangle collision
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }
}
