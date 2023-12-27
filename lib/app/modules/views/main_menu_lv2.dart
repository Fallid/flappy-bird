import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/bindings/game_start_lv2_binding.dart';
import 'package:flappy_bird/app/modules/controllers/game_start_lv2_controller.dart';
import 'package:flappy_bird/app/modules/game_start_lv2/GamePlay.dart';
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

      return Scaffold(
        body: GestureDetector(
          onTap: () {
            controller.onStartPlaying();
          },
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
      );
    });
  }
}
