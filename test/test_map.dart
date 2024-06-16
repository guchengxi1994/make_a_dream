import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
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
    return LayoutBuilder(builder: (c, con) {
      return BonfireWidget(
        map: WorldMapByTiled(WorldMapReader.fromAsset('tiled/maps/city.tmj')),
        playerControllers: [
          Joystick(directional: JoystickDirectional()),
          Keyboard(),
        ],
        player: HumanPlayer(
          position: Vector2(32, 32),
        ),
        cameraConfig: CameraConfig(
          zoom: 2,
        ),
        overlayBuilderMap: {
          // 'setting': (ctx, game) => const SettingButton(),
          'miniMap': (context, game) => MiniMap(
                game: game,
                margin: const EdgeInsets.all(20),
                borderRadius: BorderRadius.circular(10),
                size: Vector2.all(
                  min(con.maxHeight, con.maxWidth) / 3,
                ),
                border: Border.all(color: Colors.white.withOpacity(0.5)),
              ),
        },
        initialActiveOverlays: const ['miniMap'],
        backgroundColor: const Color(0xff20a0b4),
      );
    });
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
