import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:make_a_dream/isar/player_record.dart';

class PlayerState {
  final List<PlayerRecord> records;
  PlayerRecord? current;

  PlayerState({required this.current, required this.records});

  PlayerState copyWith({List<PlayerRecord>? records, PlayerRecord? current}) {
    return PlayerState(
        current: current ?? this.current, records: records ?? this.records);
  }
}

class PlayerNotifier extends Notifier<PlayerState> {
  final IsarDatabase database = IsarDatabase();

  @override
  PlayerState build() {
    final records = database.isar!.playerRecords.where().findAllSync();
    return PlayerState(current: null, records: records);
  }

  changeCurrent(PlayerRecord record) {
    state = state.copyWith(current: record);
  }

  changeAndUpdate(PlayerRecord record) async {
    state = state.copyWith(current: record);
    await database.isar!.writeTxn(() async {
      await database.isar!.playerRecords.put(record);
    });
  }

  Future createNewRecord(String name) async {
    PlayerRecord record = PlayerRecord()..name = name;
    await database.isar!.writeTxn(() async {
      await database.isar!.playerRecords.put(record);
    });

    state = state.copyWith(current: record);
  }
}

final playerProvider = NotifierProvider<PlayerNotifier, PlayerState>(
  () => PlayerNotifier(),
);
