import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GameStartController extends GetxController {
  final GamePlay play;
  GameStartController({required this.play});
  final _authCollection = FirebaseFirestore.instance.collection("Profile");
  final _userToken = GetStorage().read("user_token");
  final _storeHighScore = GetStorage();

  void onStartPlaying() {
    play.overlays.remove(Routes.GAMESTART);
    play.resumeEngine();
  }

  void onPause() {
    play.pauseEngine();
  }

  Future<void> initRealtimeScore() async {
    _authCollection.doc(_userToken).update({'realtime score': 0});
  }

  Future<void> getHighScore() async {
    try {
      DocumentSnapshot userDoc = await _authCollection.doc(_userToken).get();
      dynamic highScore = userDoc.get("high score");
      _storeHighScore.write("high score", highScore);
    } catch (e) {}
  }
}
