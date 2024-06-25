import 'package:bonfire/bonfire.dart' as b;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';

class MultipleMapNotifier extends Notifier<String> {
  Map<String, b.Vector2> lastPosition = {};

  @override
  String build() {
    lastPosition[GameInitialRoute.routeName] = b.Vector2(0, 0);
    return GameInitialRoute.routeName;
  }

  switchTo(String routeName) {
    if (state != routeName) {
      state = routeName;
    }
  }

  changePosition(b.Vector2 position) {
    lastPosition[state] = position;
  }

  b.Vector2? getCurrentPosition() {
    return lastPosition[state];
  }
}

final multipleMapProvider = NotifierProvider<MultipleMapNotifier, String>(
  () => MultipleMapNotifier(),
);
