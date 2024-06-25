import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/fes_dialog.dart';
import 'package:make_a_dream/game/decorations/decoration_mixin.dart';

class Fes extends GameDecoration with Sensor<Player>, DecorationMixin {
  Fes({required super.position, required super.size, required this.ref});

  bool isTouched = false;
  final WidgetRef ref;

  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();
      showGeneralDialog(
          barrierLabel: "fes",
          barrierDismissible: true,
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (c, _, __) {
            return const Center(
              child: FesDialog(),
            );
          });
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
