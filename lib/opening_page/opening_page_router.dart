import 'package:flutter/material.dart';
import 'package:make_a_dream/opening_page/openging_page.dart';

class OpengingPageRouter {
  static const String routeName = "/";

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => const OpeningPage(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamedAndRemoveUntil(context, routeName, (_) => false);
  }
}
