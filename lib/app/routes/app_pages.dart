import 'package:flappy_bird/app/modules/bindings/auth_binding.dart';
import 'package:flappy_bird/app/modules/bindings/init_app_binding.dart';
import 'package:flappy_bird/app/modules/bindings/leader_board_easy_binding.dart';
import 'package:flappy_bird/app/modules/bindings/leader_board_hard_binding.dart';
import 'package:flappy_bird/app/modules/bindings/level_stage_binding.dart';
import 'package:flappy_bird/app/modules/views/choiLogReg.dart';
import 'package:flappy_bird/app/modules/views/game_init_lv2_view%20.dart';
import 'package:flappy_bird/app/modules/views/game_init_view.dart';
import 'package:flappy_bird/app/modules/views/leader_board__easy_view.dart';
import 'package:flappy_bird/app/modules/views/leader_board_hard_view.dart';
import 'package:flappy_bird/app/modules/views/level_stage_view.dart';
import 'package:flappy_bird/app/modules/views/login_page.dart';
import 'package:flappy_bird/app/modules/views/register_page.dart';
import 'package:get/get.dart';

import '../modules/bindings/home_binding.dart';
import '../modules/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHOISE;
  static const LOGGED = Routes.LEVELSTAGE;

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
        name: _Paths.LOGIN, page: () => const Login(), binding: AuthBinding()),
    GetPage(
        name: _Paths.REGISTER,
        page: () => const Register(),
        binding: AuthBinding()),
    GetPage(
        name: _Paths.GAMEVIEW,
        page: () => const GameView(),
        binding: InitAppBinding()),
    GetPage(
        name: _Paths.GAMEVIEWLV2,
        page: () => const GameViewLv2(),
        binding: InitAppBinding()),
    GetPage(
        name: _Paths.LEVELSTAGE,
        page: () => const LevelStageView(),
        binding: LevelStageBinding()),
    GetPage(
        name: _Paths.LEADERBOARD,
        page: () => const LeaderBoardEasyView(),
        binding: LeaderBoardEasyBinding()),
    GetPage(
        name: _Paths.LEADERBOARDHARD,
        page: () => const LeaderBoardHardView(),
        binding: LeaderBoardHardBinding())
  ];
}
