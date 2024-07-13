import 'dart:io';
import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/decorations/air_wall.dart';
import 'package:make_a_dream/game/decorations/base_mentor.dart';
import 'package:make_a_dream/game/decorations/room_bg.dart';
import 'package:make_a_dream/game/decorations/writer_home_exit.dart';
import 'package:make_a_dream/game/player.dart';
import 'package:make_a_dream/style/app_style.dart';

class WriterHome extends ConsumerWidget {
  const WriterHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (c, con) {
      return BonfireWidget(
        map: WorldMapByTiled(
            WorldMapReader.fromAsset('tiled/maps/writers_home.tmj'),
            objectsBuilder: {
              "air_wall": (p) => AirWall(p.position, p.size),
              "bg": (p) => RoomBg(
                  position: p.position,
                  size: p.size,
                  path: "writer_home_bg.jpeg"),
              "writer": (p) => BaseMentor(
                  position: p.position,
                  size: p.size,
                  mentorName: "writer",
                  path: "76.png",
                  ref: ref),
              "exit": (p) =>
                  WritersHomeExit(position: p.position, size: p.size, ref: ref)
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
        player: SinglePlayer(ref: ref, playerSize: (16, 16)),
        cameraConfig: CameraConfig(
          zoom: 2,
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
