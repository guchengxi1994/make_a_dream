import 'package:bonfire/bonfire.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/notifiers/multiple_map_notifier.dart';

mixin DecorationMixin on GameDecoration {
  void updatePosition(WidgetRef ref, Vector2 position) {
    ref.read(multipleMapProvider.notifier).changePosition(position);
  }
}
