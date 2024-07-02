import 'package:bonfire/bonfire.dart' hide Notifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';
import 'package:make_a_dream/game/notifiers/multiple_map_state.dart';
import 'package:make_a_dream/game/notifiers/player_notifier.dart';
import 'package:make_a_dream/game/util.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:make_a_dream/isar/player_record.dart';

class MultipleMapNotifier extends Notifier<MultipleMapState> {
  final IsarDatabase isarDatabase = IsarDatabase();

  @override
  MultipleMapState build() {
    final player = isarDatabase.isar!.playerRecords
        .filter()
        .idEqualTo(ref.read(playerProvider).current!.id)
        .findFirstSync();

    if (player!.lastPostition != null) {
      return MultipleMapState(
        routeName: player.lastPostition!.routeName,
        position: Vector2(player.lastPostition!.x, player.lastPostition!.y),
      );
    }

    return MultipleMapState(
      routeName: GameInitialRoute.routeName,
      position: Vector2(tileSize * 6.8, tileSize * 6),
    );
  }

  switchTo(String routeName, {Vector2? initial}) {
    if (state.routeName != routeName) {
      final LastPostition lastPosition = LastPostition()
        ..routeName = routeName
        ..x = initial?.x ?? 32
        ..y = initial?.y ?? 32;

      state = state.copyWith(
        routeName: routeName,
        position: Vector2(lastPosition.x, lastPosition.y),
      );

      changePosition(Vector2(lastPosition.x, lastPosition.y));
    }
  }

  changePosition(Vector2 position) {
    // 确保不重复保存

    final player = isarDatabase.isar!.playerRecords
        .filter()
        .idEqualTo(ref.read(playerProvider).current!.id)
        .findFirstSync()!;

    if ((player.lastPostition != null &&
            player.lastPostition!.x != position.x &&
            player.lastPostition!.y != position.y) ||
        player.lastPostition == null) {
      isarDatabase.isar!.writeTxn(() async {
        player.lastPostition = LastPostition()
          ..routeName = state.routeName
          ..x = position.x
          ..y = position.y;
        await isarDatabase.isar!.playerRecords.put(player);
      });
    }
  }

  Vector2? getCurrentPosition() {
    return state.position;
  }
}

final multipleMapProvider =
    NotifierProvider<MultipleMapNotifier, MultipleMapState>(
  () => MultipleMapNotifier(),
);
