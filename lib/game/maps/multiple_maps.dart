import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/page_wrapper.dart';
import 'package:make_a_dream/game/maps/building_of_sages.dart';
import 'package:make_a_dream/game/maps/game_initial.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';
import 'package:make_a_dream/game/maps/multiple_map_notifier.dart';

class MultipleMaps extends ConsumerWidget {
  const MultipleMaps({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleMapProvider);

    return PageWrapper(
        child: AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      switchInCurve: Curves.easeOutCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: _renderWidget(state),
    ));
  }

  _renderWidget(String state) {
    if (state == GameInitialRoute.routeName) {
      return const GameInitialPage();
    } else {
      return const BuildingOfSages();
    }
  }
}
