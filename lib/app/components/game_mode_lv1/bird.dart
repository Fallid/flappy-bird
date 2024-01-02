import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/components/style/sound_local.dart';
import 'package:flappy_bird/app/modules/game_start/movement.dart';
import 'package:flappy_bird/app/modules/game_start/configuration.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<GamePlay>, CollisionCallbacks {
  Bird();
  dynamic score = 0;

  @override
  Future<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite(ImageLocal.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(ImageLocal.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(ImageLocal.birdDownFlap);

    gameRef.bird;

    size = Vector2(50, 40);
    current = BirdMovement.middle;
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };

    add(CircleHitbox());
  }

  void fly() {
    add(MoveByEffect(Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down));
    current = BirdMovement.up;
    FlameAudio.play(SoundLocal.flying);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    debugPrint("Interact avagtar with obstacle");
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    gameRef.overlays.add(Routes.GAMEOVER);
    gameRef.pauseEngine();
    FlameAudio.play(SoundLocal.collision);
    game.isHit = true;
    gameRef.pauseEngine();
  }
}
