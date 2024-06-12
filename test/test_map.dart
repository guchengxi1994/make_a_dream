import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/decorations/air_wall.dart';
import 'package:make_a_dream/game/util.dart';

class HumanPlayer extends SimplePlayer with BlockMovementCollision {
  HumanPlayer({
    required super.position,
  }) : super(
          animation: PersonSpritesheet().simpleAnimation(),
          size: Vector2.all(24),
          speed: 100,
        );

  @override
  Future<void> onLoad() {
    /// Adds rectangle collision
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }
}

class SimplePlayerPage extends StatelessWidget {
  const SimplePlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
          WorldMapReader.fromAsset('tiled/maps/buildings_of_sage.tmj'),
          objectsBuilder: {"air_wall": (p) => AirWall(p.position, p.size)}),
      playerControllers: [
        Joystick(directional: JoystickDirectional()),
        Keyboard(),
      ],
      player: HumanPlayer(
        position: Vector2(0, 0),
      ),
      cameraConfig: CameraConfig(
        zoom: 3,
      ),
      backgroundColor: const Color(0xff20a0b4),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
  runApp(const MaterialApp(
    home: SimplePlayerPage(),
  ));
}
