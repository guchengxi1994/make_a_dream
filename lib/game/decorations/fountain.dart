import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/fountain_dialog.dart';

class Fountain extends GameDecoration with Sensor<Player> {
  Fountain({required super.position, required super.size});

  bool isTouched = false;

  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();
      showGeneralDialog(
          barrierLabel: "fountain",
          barrierDismissible: true,
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (c, _, __) {
            return const Center(
              child: FountainDialog(),
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
