import 'dart:io';
import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/decorations/air_wall.dart';
import 'package:make_a_dream/game/decorations/room_bg.dart';
import 'package:make_a_dream/game/deprecated/human_player.dart';

class Room extends ConsumerWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (c, con) {
      return BonfireWidget(
        map: WorldMapByTiled(WorldMapReader.fromAsset('tiled/maps/room.tmj'),
            objectsBuilder: {
              "air_wall": (p) => AirWall(p.position, p.size),
              "image": (p) => RoomBg(position: p.position, size: p.size)
            }),
        playerControllers: [
          if (Platform.isAndroid || Platform.isIOS)
            Joystick(directional: JoystickDirectional()),
          Keyboard(
            config: KeyboardConfig(
              directionalKeys: [
                KeyboardDirectionalKeys.arrows(),
                KeyboardDirectionalKeys.wasd(),
              ],
            ),
          )
        ],
        player: HumanPlayer(position: Vector2(2 * 48, 8 * 48)),
        cameraConfig: CameraConfig(
          zoom: 1,
        ),
        backgroundColor: const Color(0xff20a0b4),
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
      );
    });
  }
}
