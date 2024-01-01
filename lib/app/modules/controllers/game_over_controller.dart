import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_bird/app/modules/game_start/GamePlay.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GameOverController extends GetxController {
  final GamePlay play;
  GameOverController({required this.play});
  final _storage = GetStorage();
  final CollectionReference _authCollection =
      FirebaseFirestore.instance.collection("Profile");
  late dynamic showHighScore = _storage.read("high score easy") ?? 0;

  void onRestart() {
    play.bird.reset();
    play.overlays.remove(Routes.GAMEOVER);
    play.overlays.add(Routes.GAMESTART);
    play.resumeEngine();
  }

  Future<void> storeFinalScore() async {
    try {
      String userToken = _storage.read("user_token");
      DocumentSnapshot userDoc = await _authCollection.doc(userToken).get();
      dynamic realTime = userDoc.get("realtime score");
      dynamic highScore = userDoc.get("high score easy");
      if (realTime > highScore) {
        _authCollection.doc(userToken).update({'high score easy': realTime});
      }
      print("high score easy:  $highScore");
      print("realtime score:  $realTime");
    } catch (e) {
      print("Error fetch data:$e");
    }
  }
}
