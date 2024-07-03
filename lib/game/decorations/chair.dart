import 'package:bonfire/bonfire.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/common/toast_utils.dart';
import 'package:make_a_dream/game/notifiers/player_notifier.dart';

class Chair extends GameDecoration with Sensor<Player> {
  Chair({required super.position, required super.size, required this.ref});

  bool isTouched = false;
  final WidgetRef ref;

  @override
  void onContact(Player component) {
    super.onContact(component);
    if (gameRef.player != null && !isTouched) {
      gameRef.player!.stopMove();
      isTouched = true;
      if (ref.read(playerProvider).current!.knowledge.total > 650) {
        ToastUtils.decorationTip(null, tip: "是时候了！");
      } else {
        ToastUtils.decorationTip(null, tip: "时机尚未成熟，我的朋友...");
        // [23 * 16  = 368,58 * 928]
        gameRef.player!.translate(Vector2(368 - position.x, 928 - position.y));
        gameRef.player!.moveDown();
      }
    }
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
