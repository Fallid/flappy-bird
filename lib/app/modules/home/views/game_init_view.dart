import 'package:flame/game.dart';
import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';
import 'package:flappy_bird/app/modules/home/views/game_over.dart';
import 'package:flappy_bird/app/modules/home/views/main_menu.dart';
import 'package:flutter/material.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    final game = GamePlay();
    return Placeholder(
      child: GameWidget(
        game: game,
        initialActiveOverlays: const [MainMenuView.id],
        overlayBuilderMap: {
          'mainMenu': (context, _) => MainMenuView(play: game),
          'gameOver': (context, _) => GameOverView(play: game)
        },
      ),
    );
  }
}
