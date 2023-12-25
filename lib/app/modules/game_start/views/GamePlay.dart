import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/app/components/background.dart';
import 'package:flappy_bird/app/components/bird.dart';
import 'package:flappy_bird/app/components/ground.dart';
import 'package:flappy_bird/app/components/pipe_ground.dart';
import 'package:flappy_bird/app/modules/game_start/controllers/configuration.dart';

class GamePlay extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  FutureOr<void> onLoad() async {
    addAll([Background(), Ground(), bird = Bird(), PipeGround()]);
    interval.onTick = () => add(PipeGround());
    return super.onLoad();
  }

  @override
  void onTap() {
    bird.fly();
    super.onTap();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    interval.update(dt);
  }
}
