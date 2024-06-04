import 'package:flutter/material.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';
import 'package:make_a_dream/opening_page/opening_page_router.dart';

class AppRouters {
  static Map<String, WidgetBuilder> get routes => {
        ...OpengingPageRouter.builder,
        ...GameInitialRoute.builder,
      };
}
