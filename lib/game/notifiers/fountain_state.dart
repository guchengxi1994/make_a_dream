import 'package:make_a_dream/game/models/plot_model.dart';
import 'package:make_a_dream/game/notifiers/base_npc_state.dart';
import 'package:make_a_dream/isar/npc.dart';

class FountainState extends BaseNpcState {
  FountainState(
      {required super.plot,
      required super.role,
      required super.npc,
      required this.dialog,
      this.options = const ["世界和平"],
      required this.conversationDone});

  final String dialog;
  final bool conversationDone;

  final List<String> options;

  FountainState copyWith(
      {String? name,
      String? role,
      Plot? plot,
      String? dialog,
      List<String>? options,
      Npc? npc,
      bool? conversationDone}) {
    return FountainState(
        plot: plot ?? this.plot,
        role: role ?? this.role,
        dialog: dialog ?? this.dialog,
        options: options ?? this.options,
        npc: npc ?? this.npc,
        conversationDone: conversationDone ?? this.conversationDone);
  }
}
