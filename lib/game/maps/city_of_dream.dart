import 'dart:io';
import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/decorations/tip_decoration.dart';
import 'package:make_a_dream/game/decorations/toast_decoration.dart';
import 'package:make_a_dream/game/npcs/animal.dart';
import 'package:make_a_dream/game/player.dart';
import 'package:make_a_dream/opening_page/notifiers/player_notifier.dart';

class CityOfDream extends ConsumerWidget {
  const CityOfDream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);
    return LayoutBuilder(builder: (c, con) {
      return BonfireWidget(
        map: WorldMapByTiled(WorldMapReader.fromAsset('tiled/maps/city.tmj'),
            objectsBuilder: {
              "enter_center_bottom": (p) => ToastDecoration(
                  position: p.position, size: p.size, toast: '许愿池'),
              "enter_right_bottom": (p) => ToastDecoration(
                  position: p.position, size: p.size, toast: 'Temper'),
              "enter_left_bottom": (p) => ToastDecoration(
                  position: p.position, size: p.size, toast: '工业区'),
              "enter_left_center": (p) => ToastDecoration(
                  position: p.position, size: p.size, toast: '水池'),
              "enter_top_right": (p) => ToastDecoration(
                  position: p.position, size: p.size, toast: '田园'),
              "enter_top_left": (p) => ToastDecoration(
                  position: p.position, size: p.size, toast: '梦之都'),
              "tip": (p) => TipDecoration(
                  position: p.position, size: p.size, tip: '注意来往车辆'),
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
        components: [
          Animal(size: Vector2(24, 32), path: "animals/output_0_0.png"),
          Animal(size: Vector2(24, 32), path: "animals/output_0_1.png"),
          Animal(size: Vector2(24, 32), path: "animals/output_0_2.png"),
          Animal(size: Vector2(24, 32), path: "animals/output_0_3.png"),
          Animal(size: Vector2(24, 32), path: "animals/output_1_0.png"),
          Animal(size: Vector2(24, 32), path: "animals/output_1_1.png"),
          Animal(size: Vector2(24, 32), path: "animals/output_1_2.png"),
          Animal(size: Vector2(24, 32), path: "animals/output_1_3.png"),
        ],
        player: SinglePlayer(
            position: Vector2(32, 32), record: playerState.current!),
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
