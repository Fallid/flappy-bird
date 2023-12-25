import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GameOverView extends StatelessWidget {
  final GamePlay play;
  static const String id = "gameOver";
  const GameOverView({Key? key, required this.play}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      return Material(
        color: Colors.black38,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score: ${play.bird.score}',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(ImageLocal.gameOver),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void onRestart() {
    play.bird.reset();
    play.overlays.remove("gameOver");
    play.resumeEngine();
  }
}
