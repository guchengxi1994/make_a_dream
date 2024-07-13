import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/maps/writer_router.dart';
import 'package:make_a_dream/game/notifiers/multiple_map_notifier.dart';

import 'decoration_mixin.dart';

class WritersHomeEntry extends GameDecoration
    with Sensor<Player>, DecorationMixin {
  WritersHomeEntry(
      {required super.position, required super.size, required this.ref});

  bool isTouched = false;
  final WidgetRef ref;

  late final TextPaint _textConfig = TextPaint(
    style: const TextStyle(color: Colors.white, fontSize: 12),
  );

  @override
  Future<void> onLoad() {
    TextComponent textComponent = TextBoxComponent(
      text: "writer's home",
      position: Vector2(0, 0),
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
    ref
        .read(multipleMapProvider.notifier)
        .switchTo(WriterRouter.routeName, initial: Vector2(8 * 16, 18 * 16));
    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
