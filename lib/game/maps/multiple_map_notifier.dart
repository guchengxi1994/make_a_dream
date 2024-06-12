import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';

class MultipleMapNotifier extends Notifier<String> {
  @override
  String build() {
    return GameInitialRoute.routeName;
  }

  switchTo(String routeName) {
    if (state != routeName) {
      state = routeName;
    }
  }
}

final multipleMapProvider = NotifierProvider<MultipleMapNotifier, String>(
  () => MultipleMapNotifier(),
);
