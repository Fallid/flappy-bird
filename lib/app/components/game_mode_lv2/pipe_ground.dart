import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/app/components/game_mode_lv2/pipe.dart';
import 'package:flappy_bird/app/components/style/sound_local.dart';
import 'package:flappy_bird/app/modules/game_start_lv2/GamePlay.dart';
import 'package:flappy_bird/app/modules/game_start_lv2/configuration.dart';
import 'package:flappy_bird/app/modules/game_start_lv2/pipe_position.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PipeGround extends PositionComponent with HasGameRef<GamePlay> {
  PipeGround();
  final _random = Random();
  final _storage = GetStorage();
  final _authCollection = FirebaseFirestore.instance.collection("Profile");
  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;
    final minimalHeightGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (minimalHeightGround / 2.5);
    final centerY =
        spacing + _random.nextDouble() * (minimalHeightGround - spacing);
    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 1.5),
      Pipe(
          pipePosition: PipePosition.bottom,
          height: minimalHeightGround - (centerY + spacing / 1.5))
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
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() async {
    String user_token = _storage.read("user_token");
    DocumentSnapshot userDoc = await _authCollection.doc(user_token).get();
    dynamic realTime = userDoc.get("realtime score");
    realTime += 1;
    gameRef.bird.score = realTime;
    _authCollection.doc(user_token).update({'realtime score': realTime});
    FlameAudio.play(SoundLocal.point);
  }
}
