import 'package:flappy_bird/app/modules/controllers/level_stage_controller.dart';
import 'package:get/get.dart';

class LevelStageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelStageController>(
      () => LevelStageController(),
    );
  }
}
