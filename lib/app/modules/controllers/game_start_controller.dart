import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:get/get.dart';

class GameStartController extends GetxController {
  final GamePlay play;
  GameStartController({required this.play});

  void onStartPlaying() {
    play.overlays.remove(Routes.GAMESTART);
    play.resumeEngine();
  }

  void onPause() {
    play.pauseEngine();
  }
}
