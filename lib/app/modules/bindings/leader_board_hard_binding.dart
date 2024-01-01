import 'package:flappy_bird/app/modules/controllers/leader_board_hard_controller.dart';
import 'package:get/get.dart';

class LeaderBoardHardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderBoardHardController>(
      () => LeaderBoardHardController(),
    );
  }
}
