import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/page_wrapper.dart';

import 'game_initial.dart';

class GameInitialRoute {
  static const String routeName = '/game-initial';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => PageWrapper(child: const GameInitialPage()),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
