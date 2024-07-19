import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/common/audio_utils.dart';
import 'package:make_a_dream/global/routers.dart';
// ignore: depend_on_referenced_packages
import 'package:logging/logging.dart';
import 'package:make_a_dream/isar/database.dart';
import 'package:toastification/toastification.dart';

import 'common/dev_utils.dart';
import 'global/ai_client.dart';
import 'i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale(); // and this
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  AiClient aiClient = AiClient();
  aiClient.initOpenAi(DevUtils.env);
  aiClient.initGameModel(DevUtils.prompt);
  aiClient.initPlot(DevUtils.plot);
  aiClient.initAchievements(DevUtils.achievements);
  aiClient.initQuiz(DevUtils.roleQuiz);

  IsarDatabase database = IsarDatabase();
  await database.initialDatabase();

  AudioUtils audioUtils = AudioUtils();
  await audioUtils.setloop();
  await audioUtils.setVolume(0.2);

  await Flame.device.setLandscape();
  await Flame.device.fullScreen();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: TranslationProvider(
            child: ToastificationWrapper(
                child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GameInitialPage(),
      routes: AppRouters.routes,
    ))));
  }
}
