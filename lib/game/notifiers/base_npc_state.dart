import 'package:make_a_dream/game/models/plot_model.dart';

class BaseNpcState {
  final String name;
  final String role;
  final Plot plot;

  BaseNpcState({required this.name, required this.plot, required this.role});
}
