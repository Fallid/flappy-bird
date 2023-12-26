import 'package:flame/game.dart';
import 'package:flappy_bird/app/modules/bindings/init_app_binding.dart';
import 'package:flappy_bird/app/modules/controllers/init_app_controller.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flappy_bird/app/modules/views/game_over.dart';
import 'package:flappy_bird/app/modules/views/main_menu.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameView extends GetView<InitAppController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    InitAppBinding().dependencies();
    controller.getHighScore();
    final game = GamePlay();
    return Placeholder(
      child: GameWidget(
        game: game,
        initialActiveOverlays: const [Routes.GAMESTART],
        overlayBuilderMap: {
          Routes.GAMESTART: (context, _) => MainMenuView(play: game),
          Routes.GAMEOVER: (context, _) => GameOverView(play: game)
        },
      ),
    );
  }
}
