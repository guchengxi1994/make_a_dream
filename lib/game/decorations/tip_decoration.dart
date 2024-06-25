import 'package:bonfire/bonfire.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/common/toast_utils.dart';
import 'package:make_a_dream/game/decorations/decoration_mixin.dart';

class TipDecoration extends GameDecoration
    with Sensor<Player>, DecorationMixin {
  TipDecoration(
      {required super.position,
      required super.size,
      required this.tip,
      required this.ref});

  final String tip;

  bool touched = false;

  final WidgetRef ref;

  @override
  void onContact(Player component) {
    if (!touched) {
      // print(toast);
      ToastUtils.decorationTip(null, tip: tip);

      touched = true;
    }
    updatePosition(ref, position);

    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    touched = false;
    super.onContactExit(component);
  }
}
