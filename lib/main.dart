import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/maps/page_initial.dart';
// ignore: depend_on_referenced_packages
import 'package:logging/logging.dart';

import 'common/dev_utils.dart';
import 'game/npcs/ai_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  AiClient aiClient = AiClient();
  aiClient.initOpenAi(DevUtils.env);
  aiClient.initGameModel(DevUtils.prompt);

  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimplePlayerPage(),
    ));
  }
}
