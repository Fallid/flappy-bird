import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:get/get.dart';

class GameOverController extends GetxController {
  final GamePlay play;
  GameOverController({required this.play});

  void onRestart() {
    play.bird.reset();
    play.overlays.remove(Routes.GAMEOVER);
    play.overlays.add(Routes.GAMESTART);
    play.resumeEngine();
  }
}
