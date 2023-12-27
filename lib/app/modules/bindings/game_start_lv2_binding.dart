import 'package:flappy_bird/app/modules/controllers/game_start_lv2_controller.dart';
import 'package:flappy_bird/app/modules/game_start_lv2/GamePlay.dart';
import 'package:get/get.dart';

class GameStartBinding extends Bindings {
  final GamePlay play;
  GameStartBinding({required this.play});
  @override
  void dependencies() {
    Get.lazyPut<GameStartController>(
      () => GameStartController(play: play),
    );
  }
}
