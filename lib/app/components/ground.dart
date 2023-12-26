import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/game_start/configuration.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';

class Ground extends ParallaxComponent<GamePlay> with HasGameRef<GamePlay> {
  Ground();
  @override
  FutureOr<void> onLoad() async {
    final ground = await Flame.images.load(ImageLocal.groundWinter);
    parallax =
        Parallax([ParallaxLayer(ParallaxImage(ground, fill: LayerFill.none))]);
    add(RectangleHitbox(
        position: Vector2(0, gameRef.size.y - Config.groundHeight),
        size: Vector2(gameRef.size.x, Config.groundHeight)));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
