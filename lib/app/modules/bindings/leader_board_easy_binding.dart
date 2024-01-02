import 'package:flappy_bird/app/modules/controllers/leader_board_easy_controller.dart';
import 'package:get/get.dart';

class LeaderBoardEasyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderBoardEasyController>(
      () => LeaderBoardEasyController(),
    );
  }
}
