import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/decorations/decoration_mixin.dart';
import 'package:make_a_dream/game/maps/room_route.dart';
import 'package:make_a_dream/game/notifiers/multiple_map_notifier.dart';
// import 'package:vector_math/vector_math_64.dart' hide Vector2;

class ClassroomEntry extends GameDecoration
    with Sensor<Player>, DecorationMixin {
  ClassroomEntry(
      {required super.position, required super.size, required this.ref});

  bool isTouched = false;
  final WidgetRef ref;

  late final TextPaint _textConfig = TextPaint(
    style: const TextStyle(color: Colors.white, fontSize: 12),
  );

  @override
  Future<void> onLoad() {
    TextComponent textComponent = TextBoxComponent(
      text: "classroom",
      position: Vector2(-20, -30),
      textRenderer: _textConfig,
    );

    add(textComponent);
    return super.onLoad();
  }

  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();
    }
    updatePosition(ref, Vector2(position.x, position.y + 20));
    ref
        .read(multipleMapProvider.notifier)
        .switchTo(RoomRoute.routeName, initial: Vector2(2 * 48, 8 * 48));
    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
