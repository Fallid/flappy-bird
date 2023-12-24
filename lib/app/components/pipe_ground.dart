import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/app/components/pipe.dart';
import 'package:flappy_bird/app/modules/game_start/controllers/configuration.dart';
import 'package:flappy_bird/app/modules/game_start/controllers/pipe_position.dart';
import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';

class PipeGround extends PositionComponent with HasGameRef<GamePlay> {
  PipeGround();

  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;
    addAll([
      Pipe(pipePosition: PipePosition.top, height: 200),
      Pipe(pipePosition: PipePosition.bottom, height: 200)
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }
}
