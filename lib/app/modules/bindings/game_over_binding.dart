import 'package:flappy_bird/app/modules/controllers/game_over_controller.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:get/get.dart';

class GameOverBinding extends Bindings {
  final GamePlay play;
  GameOverBinding({required this.play});
  @override
  void dependencies() {
    Get.lazyPut<GameOverController>(
      () => GameOverController(play: play),
    );
  }
}
