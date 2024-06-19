import 'package:bonfire/bonfire.dart';
import 'package:make_a_dream/common/toast_utils.dart';

class TipDecoration extends GameDecoration with Sensor<Player> {
  TipDecoration(
      {required super.position, required super.size, required this.tip});

  final String tip;

  bool touched = false;

  @override
  void onContact(Player component) {
    if (!touched) {
      // print(toast);
      ToastUtils.decorationTip(null, tip: tip);

      touched = true;
    }

    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    touched = false;
    super.onContactExit(component);
  }
}
