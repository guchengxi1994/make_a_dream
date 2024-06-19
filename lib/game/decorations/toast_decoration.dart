import 'package:bonfire/bonfire.dart';
import 'package:make_a_dream/common/toast_utils.dart';

class ToastDecoration extends GameDecoration with Sensor<Player> {
  ToastDecoration(
      {required super.position, required super.size, required this.toast});

  final String toast;

  bool touched = false;

  @override
  void onContact(Player component) {
    if (!touched) {
      // print(toast);
      ToastUtils.decorationToast(null, toast: toast);

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
