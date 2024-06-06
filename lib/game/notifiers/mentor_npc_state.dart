import 'package:make_a_dream/game/models/plot_model.dart';
import 'package:make_a_dream/game/notifiers/base_npc_state.dart';
import 'package:make_a_dream/isar/npc.dart';

class MentorNpcState extends BaseNpcState {
  MentorNpcState(
      {required super.plot,
      required super.role,
      required super.npc,
      this.dialog = "",
      // this.npcStage = NpcStage.unknow,
      this.conversationDone = false});
  final String dialog;
  // final NpcStage npcStage;
  final bool conversationDone;

  MentorNpcState copyWith(
      {String? name,
      String? role,
      Plot? plot,
      String? dialog,
      NpcStage? npcStage,
      bool? conversationDone,
      Npc? npc}) {
    return MentorNpcState(
        plot: plot ?? this.plot,
        role: role ?? this.role,
        dialog: dialog ?? this.dialog,
        conversationDone: conversationDone ?? this.conversationDone,
        npc: npc ?? this.npc);
  }
}
