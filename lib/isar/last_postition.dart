import 'package:isar/isar.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';

part 'last_postition.g.dart';

@collection
class LastPostition {
  late String routeName = GameInitialRoute.routeName;
  Id id = Isar.autoIncrement;
  int createAt = DateTime.now().millisecondsSinceEpoch;
  late double x = 0;
  late double y = 0;
}
