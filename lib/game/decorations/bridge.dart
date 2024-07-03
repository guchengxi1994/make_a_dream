import 'package:bonfire/bonfire.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/decorations/decoration_mixin.dart';

class Bridge extends GameDecoration with Sensor<Player>, DecorationMixin {
  Bridge({required super.position, required super.size, required this.ref});

  bool isTouched = false;
  final WidgetRef ref;

  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();
    }
    updatePosition(ref, position);
    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
