import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/bindings/game_over_lv2_binding.dart';
import 'package:flappy_bird/app/modules/controllers/game_over_lv2_controller.dart';
import 'package:flappy_bird/app/modules/game_start_lv2/GamePlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GameOverView extends GetView<GameOverController> {
  final GamePlay play;
  const GameOverView({Key? key, required this.play}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      GameOverBinding(play: play).dependencies();
      controller.storeFinalScore();
      return Material(
        color: Colors.black38,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score: ${controller.play.bird.score}',
                style: TextStyle(
                  fontSize: 60.sp,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Your High Score: ${controller.showHighScore}',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              SizedBox(height: 2.h),
              Image.asset(ImageLocal.gameOver),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: controller.onRestart,
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
}
