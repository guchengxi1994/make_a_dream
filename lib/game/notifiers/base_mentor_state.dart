import 'package:make_a_dream/game/models/plot_model.dart';
import 'package:make_a_dream/isar/npc.dart';

import 'base_npc_state.dart';

class BaseMentorState extends BaseNpcState {
  BaseMentorState(
      {required super.plot,
      required super.role,
      required super.npc,
      required this.dialog,
      required this.conversationDone});

  final String dialog;
  final bool conversationDone;

  BaseMentorState copyWith(
      {String? name,
      String? role,
      Plot? plot,
      String? dialog,
      Npc? npc,
      bool? conversationDone}) {
    return BaseMentorState(
        plot: plot ?? this.plot,
        role: role ?? this.role,
        dialog: dialog ?? this.dialog,
        npc: npc ?? this.npc,
        conversationDone: conversationDone ?? this.conversationDone);
  }
}
