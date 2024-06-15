// copied from `bonfire` example
import 'package:bonfire/bonfire.dart';

const tileSize = 16.0;
const contactDistance = 12.0;

enum PersonAttackEnum {
  meeleDown,
  meeleUp,
  meeleLeft,
  meeleRight,
  meeleUpRight,
  meeleDownRight,
  meeleUpLeft,
  meeleDownLeft,

  rangeDown,
  rangeUp,
  rangeLeft,
  rangeRight,
  rangeUpRight,
  rangeDownRight,
  rangeUpLeft,
  rangeDownLeft,
}

class PersonSpritesheet {
  final String path;

  static double size = 32;

  PersonSpritesheet({this.path = 'human2.png'});

  SimpleDirectionAnimation simpleAnimation() {
    return SimpleDirectionAnimation(
      idleRight: getIdleRight,
      idleDown: getIdleDown,
      idleUp: getIdleUp,
      runRight: getRunRight,
      runDown: getRunDown,
      runUp: getRunUp,
    );
  }

  Future<SpriteAnimation> get getIdleDown {
    return SpriteAnimation.load(
      path,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.2,
        textureSize: Vector2.all(size),
      ),
    );
  }

  Future<SpriteAnimation> get getIdleRight {
    return SpriteAnimation.load(
      path,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.2,
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size * 2),
      ),
    );
  }

  Future<SpriteAnimation> get getIdleUp {
    return SpriteAnimation.load(
      path,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.2,
        textureSize: Vector2.all(size),
        texturePosition: Vector2(0, size * 3),
      ),
    );
  }

  get getRunRight {
    return SpriteAnimation.load(
      path,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.2,
        textureSize: Vector2.all(size),
        texturePosition: Vector2(64, size * 2),
      ),
    );
  }

  get getRunDown {
    return SpriteAnimation.load(
      path,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.2,
        textureSize: Vector2.all(size),
        texturePosition: Vector2(64, 0),
      ),
    );
  }

  get getRunUp {
    return SpriteAnimation.load(
      path,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.2,
        textureSize: Vector2.all(size),
        texturePosition: Vector2(64, size * 3),
      ),
    );
  }
}
