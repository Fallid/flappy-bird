import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/bindings/game_start_binding.dart';
import 'package:flappy_bird/app/modules/controllers/game_start_controller.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MainMenuView extends GetView<GameStartController> {
  final GamePlay play;
  const MainMenuView({Key? key, required this.play}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      GameStartBinding(play: play).dependencies();
      controller.onPause();
      controller.initRealtimeScore();
      controller.getHighScore();

      return Scaffold(
        body: GestureDetector(
          onTap: () {
            controller.onStartPlaying();
          },
          child: Stack(children: [
            Positioned(
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageLocal.menu),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.asset(ImageLocal.message),
              ),
            ),
            Positioned(
                bottom: 20,
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.LEADERBOARD);
                    },
                    icon: Icon(
                      Icons.bar_chart,
                      size: 24.sp,
                    ))),
            Positioned(
                bottom: 20,
                left: 40,
                child: IconButton(
                    onPressed: () {
                      controller.logout();
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 24.sp,
                    ))),
          ]),
        ),
      );
    });
  }
}
