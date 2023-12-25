import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/game_start/controllers/configuration.dart';
import 'package:flappy_bird/app/modules/game_start/controllers/pipe_position.dart';
import 'package:flappy_bird/app/modules/game_start/views/GamePlay.dart';

class Pipe extends SpriteComponent with HasGameRef<GamePlay> {
  Pipe({required this.pipePosition, required this.height});

  final PipePosition pipePosition;
  @override
  final double height;

  @override
  FutureOr<void> onLoad() async {
    final pipe = await Flame.images.load(ImageLocal.pipe);
    final pipeRotated = await Flame.images.load(ImageLocal.pipeRotated);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0.0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
    return super.onLoad();
  }
}
