import 'package:firebase_core/firebase_core.dart';
import 'package:flappy_bird/firebase_options.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    //Uncomment this line if you want play the game
    // GameWidget(game: GamePlay())
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
