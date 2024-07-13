import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/simple_dialog.dart';

import 'decoration_mixin.dart';

class Peach extends GameDecoration with Sensor<Player>, DecorationMixin {
  Peach(
      {required super.position,
      required super.size,
      required this.ref,
      required this.name});

  bool isTouched = false;
  final WidgetRef ref;
  final String name;
  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();

      showGeneralDialog(
          barrierLabel: name,
          barrierDismissible: true,
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (c, _, __) {
            return Center(
              child: SimpleChatDialog(
                name: name,
                prompt: "请即兴创作一首关于《桃》的诗词，注意：只需要返回诗词的内容，不需要其它无关内容。",
              ),
            );
          });
    }
    updatePosition(ref, position);
    super.onContact(component);
  }
}
