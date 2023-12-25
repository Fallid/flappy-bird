import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainMenuView extends StatelessWidget {
  final GamePlay play;
  static const String id = 'mainMenu';
  const MainMenuView({Key? key, required this.play}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      play.pauseEngine();

      return Scaffold(
        body: GestureDetector(
          onTap: () {
            play.overlays.remove('mainMenu');
            play.resumeEngine();
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
