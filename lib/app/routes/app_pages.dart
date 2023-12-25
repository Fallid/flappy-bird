import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flappy_bird/app/modules/views/choiLogReg.dart';
import 'package:flappy_bird/app/modules/views/game_init_view.dart';
import 'package:flappy_bird/app/modules/views/login_page.dart';
import 'package:flappy_bird/app/modules/views/main_menu.dart';
import 'package:flappy_bird/app/modules/views/register_page.dart';
import 'package:get/get.dart';

import '../modules/bindings/home_binding.dart';
import '../modules/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHOISE;
  static const LOGGED = Routes.GAMEVIEW;

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
