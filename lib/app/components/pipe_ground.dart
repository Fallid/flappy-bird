import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/app/components/pipe.dart';
import 'package:flappy_bird/app/modules/game_start/controllers/configuration.dart';
import 'package:flappy_bird/app/modules/game_start/controllers/pipe_position.dart';
import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';
import 'package:flutter/material.dart';

class PipeGround extends PositionComponent with HasGameRef<GamePlay> {
  PipeGround();
  final _random = Random();

  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;
    final minimalHeightGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (minimalHeightGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (minimalHeightGround - spacing);
    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(
          pipePosition: PipePosition.bottom,
          height: minimalHeightGround - (centerY + spacing / 2))
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
    if (position.x < -10) {
      removeFromParent();
      debugPrint("Avatar hit the pipe!");
    }
  }
}
