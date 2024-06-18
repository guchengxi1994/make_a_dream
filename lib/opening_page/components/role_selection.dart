import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/player.dart';
import 'package:badges/badges.dart' as badges;
import 'package:make_a_dream/opening_page/notifiers/create_player_notifier.dart';

class RoleSelection extends ConsumerStatefulWidget {
  const RoleSelection({super.key});

  @override
  ConsumerState<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends ConsumerState<RoleSelection> {
  // ignore: avoid_init_to_null
  int? selectedIndex = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: 300,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_role1(), _role2()],
      ),
    );
  }

  Widget _role1() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = 0;
        });
        ref.read(createPlayerProvider.notifier).setRolePath("human2.png");
      },
      child: badges.Badge(
        badgeContent: const Text(
          "√",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        showBadge: selectedIndex == 0,
        child: SizedBox(
          width: 100,
          height: 66,
          child: BonfireWidget(
            map: WorldMapByTiled(
                WorldMapReader.fromAsset('tiled/maps/select.tmj')),
            player: SelectPlayer(position: Vector2(16, 5)),
            backgroundColor: Colors.white,
            cameraConfig: CameraConfig(
              startFollowPlayer: false,
              moveOnlyMapArea: true,
              zoom: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _role2() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = 1;
        });
        ref.read(createPlayerProvider.notifier).setRolePath("human.png");
      },
      child: badges.Badge(
        badgeContent: const Text(
          "√",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        showBadge: selectedIndex == 1,
        child: SizedBox(
          width: 100,
          height: 66,
          child: BonfireWidget(
            map: WorldMapByTiled(
              WorldMapReader.fromAsset('tiled/maps/select.tmj'),
            ),
            player: SelectPlayer(position: Vector2(16, 5), path: "human.png"),
            backgroundColor: Colors.white,
            cameraConfig: CameraConfig(
              startFollowPlayer: false,
              moveOnlyMapArea: true,
              zoom: 2,
            ),
          ),
        ),
      ),
    );
  }
}
