import 'dart:async';

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

  bool talkedToday(String name) {
    final lastHistory = state.current!.npcs
        .where((v) => v.name == name)
        .first
        .history
        .lastOrNull;
    if (lastHistory == null) {
      return false;
    }
    DateTime now = DateTime.now();
    // 获取当天的日期，时间设置为午夜
    DateTime startOfDay = DateTime(now.year, now.month, now.day);

    DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    return lastHistory.createAt > startOfDay.millisecondsSinceEpoch &&
        lastHistory.createAt < endOfDay.millisecondsSinceEpoch;
  }

  Future<bool> couldDo() async {
    DateTime now = DateTime.now();

    // 获取当天的日期，时间设置为午夜
    DateTime startOfDay = DateTime(now.year, now.month, now.day);

    DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    final l = await database.isar!.playerRecords
        .where()
        .idEqualTo(state.current!.id)
        .findFirst();

    if (l == null) {
      return false;
    }

    return state.current!.ability.vitality >
        l.playerEvents
            .where((v) =>
                v.createAt >= startOfDay.millisecondsSinceEpoch &&
                v.createAt < endOfDay.millisecondsSinceEpoch)
            .length;
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

  Future<int> createNewRecord(String name,
      {List<PlayerAbility> ability = const [],
      List<PlayerKnowledge> knowledge = const [],
      String rolePath = "human2.png"}) async {
    PlayerRecord record = PlayerRecord()..name = name;
    for (final i in ability) {
      record.ability = record.ability + i;
    }
    for (final i in knowledge) {
      record.knowledge = record.knowledge + i;
    }
    record.rolePath = rolePath;
    await database.isar!.writeTxn(() async {
      await database.isar!.playerRecords.put(record);
    });

    state = state.copyWith(current: record);
    return record.id;
  }
}

final playerProvider = NotifierProvider<PlayerNotifier, PlayerState>(
  () => PlayerNotifier(),
);
