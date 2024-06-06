import 'package:make_a_dream/game/models/plot_model.dart';
import 'package:make_a_dream/game/notifiers/base_npc_state.dart';
import 'package:make_a_dream/isar/npc.dart';

class MentorNpcState extends BaseNpcState {
  MentorNpcState(
      {required super.name,
      required super.plot,
      required super.role,
      this.dialog = "",
      this.npcStage = NpcStage.unknow,
      this.conversationDone = false});
  final String dialog;
  final NpcStage npcStage;
  final bool conversationDone;

  MentorNpcState copyWith(
      {String? name,
      String? role,
      Plot? plot,
      String? dialog,
      NpcStage? npcStage,
      bool? conversationDone}) {
    return MentorNpcState(
        name: name ?? this.name,
        plot: plot ?? this.plot,
        role: role ?? this.role,
        dialog: dialog ?? this.dialog,
        npcStage: npcStage ?? this.npcStage,
        conversationDone: conversationDone ?? this.conversationDone);
  }
}
