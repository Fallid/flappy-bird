import 'package:firebase_core/firebase_core.dart';
import 'package:flappy_bird/app/modules/home/views/game_over.dart';
import 'package:flappy_bird/app/modules/home/views/main_menu.dart';
import 'package:flappy_bird/firebase_options.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  final game = GamePlay();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      //Uncomment this line if you want play the game
      GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuView.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuView(play: game),
      'gameOver': (context, _) => GameOverView(play: game)
    },
  )
      // const MyApp()
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      if (kDebugMode) {}
      return GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}
