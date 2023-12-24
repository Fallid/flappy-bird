import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/app/components/pipe.dart';
import 'package:flappy_bird/app/modules/game_start/controllers/pipe_position.dart';

class PipeGround extends PositionComponent {
  PipeGround();

  @override
  FutureOr<void> onLoad() async {
    addAll([
      Pipe(pipePosition: PipePosition.top, height: 200),
      Pipe(pipePosition: PipePosition.bottom, height: 200)
    ]);
    return super.onLoad();
  }
}
