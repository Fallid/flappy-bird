import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';

class Background extends SpriteComponent with HasGameRef<GamePlay> {
  Background();

  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load(ImageLocal.backgroundWinter);
    size = gameRef.size;
    sprite = Sprite(background);
    return super.onLoad();
  }
}
