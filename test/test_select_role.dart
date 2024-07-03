import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:make_a_dream/opening_page/components/role_selection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: RoleSelection(),
      ),
    ),
  ));
}
