import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlurNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() {
    return false;
  }

  changeState() {
    state = !state;
  }
}

final blurProvider = AutoDisposeNotifierProvider<BlurNotifier, bool>(
  () => BlurNotifier(),
);
