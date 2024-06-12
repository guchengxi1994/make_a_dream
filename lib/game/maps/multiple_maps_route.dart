import 'package:flutter/material.dart';
import 'package:make_a_dream/game/maps/multiple_maps.dart';

class MultipleMapsRoute {
  static const String routeName = '/maps';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => const MultipleMaps(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamedAndRemoveUntil(context, routeName, (_) => false);
  }
}
