import 'package:bonfire/bonfire.dart';
import 'package:make_a_dream/game/util.dart';

class Animal extends SimpleNpc with RandomMovement, BlockMovementCollision {
  Animal({required super.size, required this.path})
      : super(
            animation: AnimalSpritesheet(path: path).simpleAnimation(),
            speed: 32,
            initDirection: Direction.down,
            position: Vector2(tileSize * 95, tileSize * 27));
  final String path;

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    runRandomMovement(dt);
    super.update(dt);
  }
}
