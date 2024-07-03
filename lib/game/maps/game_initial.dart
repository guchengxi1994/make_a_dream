import 'dart:io';
import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/decorations/initial_map_door.dart';
import 'package:make_a_dream/game/npcs/mentor_npc.dart';
import 'package:make_a_dream/game/util.dart';
import 'package:make_a_dream/style/app_style.dart';

import '../player.dart';

class GameInitialPage extends ConsumerWidget {
  const GameInitialPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final playerState = ref.watch(playerProvider);

    return LayoutBuilder(builder: (c, con) {
      return BonfireWidget(
        map: WorldMapByTiled(
            WorldMapReader.fromAsset('tiled/punnyworld/simple_map.tmj'),
            objectsBuilder: {
              "door": (p) =>
                  InitialMapDoor(position: p.position, size: p.size, ref: ref)
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
              acceptedKeys: [
                LogicalKeyboardKey.space,
              ],
            ),
          )
        ],
        player: SinglePlayer(ref: ref),
        components: [
          MentorNpc(
            ref: ref,
            size: Vector2.all(18),
          ),
        ],
        cameraConfig: CameraConfig(
          zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
        ),
        backgroundColor: AppStyle.gameBackground,
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
