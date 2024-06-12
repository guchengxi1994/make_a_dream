// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bonfire/bonfire.dart';

class AirWall extends GameDecoration with Sensor {
  AirWall(Vector2 position, Vector2 size,
      {this.mapHeight = 320, this.mapWidth = 480})
      : super(
          position: position,
          size: size,
        );

  bool touched = false;

  final double mapWidth;
  final double mapHeight;

  @override
  void update(double dt) {
    if (gameRef.player!.position.x < 0 && gameRef.player!.position.y < 0) {
      gameRef.player!.translate(Vector2(
          gameRef.player!.position.x.abs(), gameRef.player!.position.y.abs()));
    }

    if (gameRef.player!.position.x > mapWidth &&
        gameRef.player!.position.y > mapHeight) {
      gameRef.player!.translate(Vector2(
          -(gameRef.player!.position.x - mapWidth),
          mapHeight - gameRef.player!.position.y));
    }

    if (gameRef.player!.position.x < 0 &&
        gameRef.player!.position.y > mapHeight) {
      gameRef.player!.translate(Vector2(gameRef.player!.position.x.abs(),
          mapHeight - gameRef.player!.position.y));
    }

    if (gameRef.player!.position.x > mapWidth &&
        gameRef.player!.position.y < 0) {
      gameRef.player!.translate(Vector2(
          -(gameRef.player!.position.x - mapWidth),
          gameRef.player!.position.y.abs()));
    }

    super.update(dt);
  }

  @override
  void onContact(GameComponent component) {
    // print("touched");
    // print(x);
    // print(gameRef.player!.position);

    if (gameRef.player != null) {
      if (gameRef.player!.position.x < 0) {
        gameRef.player!.translate(Vector2(gameRef.player!.position.x.abs(), 0));
      } else if (gameRef.player!.position.x + 15 > mapWidth) {
        gameRef.player!.translate(
            Vector2(-(gameRef.player!.position.x + 15 - mapWidth), 0));
      } else if (gameRef.player!.position.y < 0) {
        gameRef.player!.translate(Vector2(0, gameRef.player!.position.y.abs()));
      } else if (gameRef.player!.position.y + 15 > mapHeight) {
        gameRef.player!.translate(
            Vector2(0, -(gameRef.player!.position.y + 15 - mapHeight)));
      }
    }
    super.onContact(component);
  }
}
