import 'dart:io';
import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/decorations/air_wall.dart';
import 'package:make_a_dream/game/player.dart';
import 'package:make_a_dream/game/notifiers/player_notifier.dart';

class BuildingOfSages extends ConsumerWidget {
  const BuildingOfSages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);
    return LayoutBuilder(builder: (c, con) {
      return BonfireWidget(
        map: WorldMapByTiled(
            WorldMapReader.fromAsset('tiled/maps/buildings_of_sage.tmj'),
            objectsBuilder: {"air_wall": (p) => AirWall(p.position, p.size)}),
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
        player:
            SinglePlayer(position: Vector2(0, 0), record: playerState.current!),
        cameraConfig: CameraConfig(
          zoom: 3,
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
