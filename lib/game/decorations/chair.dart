import 'package:bonfire/bonfire.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/common/toast_utils.dart';
import 'package:make_a_dream/game/notifiers/player_notifier.dart';
import 'package:make_a_dream/i18n/strings.g.dart';

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
        ToastUtils.decorationTip(null, tip: Translations.of(context).chair.now);
      } else {
        ToastUtils.decorationTip(null,
            tip: Translations.of(context).chair.not_now);
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
