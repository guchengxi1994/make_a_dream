import 'package:bonfire/bonfire.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/decorations/decoration_mixin.dart';
import 'package:make_a_dream/game/maps/city_of_dream_route.dart';
import 'package:make_a_dream/game/notifiers/multiple_map_notifier.dart';

class ClassroomExit extends GameDecoration
    with Sensor<Player>, DecorationMixin {
  ClassroomExit(
      {required super.position, required super.size, required this.ref});

  bool isTouched = false;
  final WidgetRef ref;

  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();
    }
    // updatePosition(ref, Vector2(position.x, position.y + 100));
    ref
        .read(multipleMapProvider.notifier)
        .switchTo(CityOfDreamRoute.routeName, initial: Vector2(160, 220));
    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
