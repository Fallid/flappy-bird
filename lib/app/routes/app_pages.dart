import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';
import 'package:flappy_bird/app/modules/home/views/choiLogReg.dart';
import 'package:flappy_bird/app/modules/home/views/game_init_view.dart';
import 'package:flappy_bird/app/modules/home/views/login_page.dart';
import 'package:flappy_bird/app/modules/home/views/main_menu.dart';
import 'package:flappy_bird/app/modules/home/views/register_page.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHOISE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHOISE,
      page: () => const Choise(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const Login(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const Register(),
    ),
    GetPage(
        name: _Paths.MAINMENU,
        page: () => MainMenuView(
              play: GamePlay(),
            )),
    GetPage(name: _Paths.GAMEVIEW, page: () => const GameView())
  ];
}
