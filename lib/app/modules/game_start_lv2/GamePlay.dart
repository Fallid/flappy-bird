import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/app/components/game_mode_lv2/background.dart';
import 'package:flappy_bird/app/components/game_mode_lv2/bird.dart';
import 'package:flappy_bird/app/components/game_mode_lv2/ground.dart';
import 'package:flappy_bird/app/components/game_mode_lv2/pipe_ground.dart';
import 'package:flappy_bird/app/modules/game_start/configuration.dart';
import 'package:flutter/material.dart';

class GamePlay extends FlameGame with TapDetector, HasCollisionDetection {
  GamePlay();
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  @override
  FutureOr<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGround(),
      score = buildScore()
    ]);
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
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }

  TextComponent buildScore() {
    return TextComponent(
        text: "Score: 0",
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
        ));
  }
}
