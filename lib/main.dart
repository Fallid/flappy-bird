import 'package:flame/game.dart';
import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(GameWidget(game: GamePlay())
      // GetMaterialApp(
      //   title: "Application",
      //   initialRoute: AppPages.INITIAL,
      //   getPages: AppPages.routes,
      // ),
      );
}
