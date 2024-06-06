import 'package:make_a_dream/game/models/plot_model.dart';
import 'package:make_a_dream/isar/npc.dart';

class BaseNpcState {
  final String role;
  final Plot plot;
  final Npc npc;

  BaseNpcState({required this.plot, required this.role, required this.npc});
}
