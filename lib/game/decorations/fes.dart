import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/fes_dialog.dart';

class Fes extends GameDecoration with Sensor<Player> {
  Fes({required super.position, required super.size});

  bool isTouched = false;

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
    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
