import 'package:bonfire/bonfire.dart' hide Notifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';
import 'package:make_a_dream/game/notifiers/multiple_map_state.dart';
import 'package:make_a_dream/game/util.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:make_a_dream/isar/last_postition.dart';

class MultipleMapNotifier extends Notifier<MultipleMapState> {
  Map<String, Vector2> lastPosition = {};
  final IsarDatabase isarDatabase = IsarDatabase();

  @override
  MultipleMapState build() {
    final last = isarDatabase.isar!.lastPostitions
        .where()
        .sortByCreateAtDesc()
        .findFirstSync();

    if (last != null) {
      return MultipleMapState(
        routeName: last.routeName,
        position: Vector2(last.x, last.y),
      );
    }

    return MultipleMapState(
      routeName: GameInitialRoute.routeName,
      position: Vector2(tileSize * 6.8, tileSize * 6),
    );
  }

  switchTo(String routeName, {Vector2? initial}) {
    if (state.routeName != routeName) {
      if (lastPosition[state.routeName] == null) {
        state = state.copyWith(
            routeName: routeName, position: initial ?? Vector2(32, 32));
        changePosition(initial ?? Vector2(32, 32));
      } else {
        state = state.copyWith(
          routeName: routeName,
          position: lastPosition[state.routeName]!,
        );
        changePosition(lastPosition[state.routeName]!);
      }
    }
  }

  changePosition(Vector2 position) {
    // print(position);
    lastPosition[state.routeName] = position;

    final last = isarDatabase.isar!.lastPostitions
        .where()
        .sortByCreateAtDesc()
        .findFirstSync();

    if ((last != null && last.x != position.x && last.y != position.y) ||
        last == null) {
      // print("save... ${state.position}    ${position}");
      isarDatabase.isar!.writeTxn(() async {
        await isarDatabase.isar!.lastPostitions.put(LastPostition()
          ..routeName = state.routeName
          ..x = position.x
          ..y = position.y);
      });
    }
  }

  Vector2? getCurrentPosition() {
    if (lastPosition[state.routeName] == null) {
      return state.position;
    }

    return lastPosition[state.routeName];
  }
}

final multipleMapProvider =
    NotifierProvider<MultipleMapNotifier, MultipleMapState>(
  () => MultipleMapNotifier(),
);
