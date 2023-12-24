import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird/app/components/background.dart';
import 'package:flappy_bird/app/components/bird.dart';
import 'package:flappy_bird/app/components/ground.dart';
import 'package:flappy_bird/app/components/pipe_ground.dart';

class GamePlay extends FlameGame {
  late Bird bird;
  @override
  FutureOr<void> onLoad() async {
    addAll([Background(), Ground(), bird = Bird(), PipeGround()]);
    return super.onLoad();
  }
}
