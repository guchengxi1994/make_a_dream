import 'package:flutter/material.dart';

import 'game_initial.dart';

class GameInitialRoute {
  static const String routeName = '/game-initial';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => const GameInitialPage(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
