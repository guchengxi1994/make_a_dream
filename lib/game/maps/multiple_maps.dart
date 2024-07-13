import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/page_wrapper.dart';
import 'package:make_a_dream/game/components/splash_wrapper.dart';
import 'package:make_a_dream/game/maps/building_of_sages.dart';
import 'package:make_a_dream/game/maps/city_of_dream.dart';
import 'package:make_a_dream/game/maps/city_of_dream_route.dart';
import 'package:make_a_dream/game/maps/game_initial.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';
import 'package:make_a_dream/game/maps/room_route.dart';
import 'package:make_a_dream/game/maps/writer_home.dart';
import 'package:make_a_dream/game/notifiers/multiple_map_notifier.dart';

import 'room.dart';
import 'writer_router.dart';

class MultipleMaps extends ConsumerWidget {
  const MultipleMaps({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleMapProvider);

    return PageWrapper(child: _renderWidget(state.routeName));
  }

  _renderWidget(String state) {
    if (state == GameInitialRoute.routeName) {
      return const SplashWrapper(child: GameInitialPage());
    } else if (state == CityOfDreamRoute.routeName) {
      return const SplashWrapper(child: CityOfDream());
    } else if (state == RoomRoute.routeName) {
      return const SplashWrapper(child: Room());
    } else if (state == WriterRouter.routeName) {
      return const SplashWrapper(child: WriterHome());
    } else {
      return const SplashWrapper(child: BuildingOfSages());
    }
  }
}
