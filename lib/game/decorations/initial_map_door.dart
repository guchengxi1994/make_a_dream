import 'package:bonfire/bonfire.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/notifiers/mentor_npc_notifier.dart';
import 'package:make_a_dream/isar/npc.dart';

class InitialMapDoor extends GameDecoration with Sensor {
  InitialMapDoor(
      {required super.position, required super.size, required this.ref})
      : super.withSprite(
          sprite: ref.read(mentorProvider).npc.stage == NpcStage.unknow
              ? Sprite.load('items/rock.png')
              : Sprite.load('items/door.png'),
        ) {
    lastStage = ref.read(mentorProvider).npc.stage;
  }

  final WidgetRef ref;

  late NpcStage lastStage;

  @override
  Future<void> update(double dt) async {
    if (ref.read(mentorProvider).npc.stage == NpcStage.meet &&
        lastStage != ref.read(mentorProvider).npc.stage) {
      sprite = await Sprite.load('items/door.png');
      lastStage = NpcStage.meet;
    }

    super.update(dt);
  }

  @override
  void onContact(GameComponent component) {
    // print(component.position);
    if (gameRef.player != null &&
        gameRef.player!.position.distanceTo(position) < 10) {
      print("touched");
    }
    super.onContact(component);
  }
}
