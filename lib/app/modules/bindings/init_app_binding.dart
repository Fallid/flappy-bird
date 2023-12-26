import 'package:flappy_bird/app/modules/controllers/init_app_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitAppController>(
      () => InitAppController(),
    );
  }
}
