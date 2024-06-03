import 'dart:io';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/npcs/mentor_npc.dart';

import '../player.dart';

class SimplePlayerPage extends ConsumerWidget {
  const SimplePlayerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const tileSize = 16.0;
    return BonfireWidget(
      map: WorldMapByTiled(
        WorldMapReader.fromAsset('tiled/punnyworld/simple_map.tmj'),
      ),
      playerControllers: [
        if (Platform.isAndroid || Platform.isIOS)
          Joystick(directional: JoystickDirectional()),
        Keyboard(
          config: KeyboardConfig(
            directionalKeys: [
              KeyboardDirectionalKeys.arrows(),
              KeyboardDirectionalKeys.wasd(),
            ],
            acceptedKeys: [
              LogicalKeyboardKey.space,
            ],
          ),
        )
      ],
      player: SinglePlayer(
        position: Vector2(tileSize * 6.8, tileSize * 6),
      ),
      components: [
        MentorNpc(
          position: Vector2(tileSize * 6.9, tileSize * 3),
          size: Vector2.all(18),
        ),
      ],
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
      ),
      backgroundColor: const Color(0xff20a0b4),
    );
  }
}
