import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_bird/app/modules/game_start_lv2/GamePlay.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GameStartController extends GetxController {
  final GamePlay play;
  GameStartController({required this.play});
  final _authCollection = FirebaseFirestore.instance.collection("Profile");
  final _userToken = GetStorage().read("user_token");
  RxBool isLoggedIn = false.obs;
  final _getStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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

  void logout() {
    _getStorage
        .remove('user_token'); // Hapus token autentikasi dari penyimpanan
    isLoggedIn.value = false; // Set status login menjadi false
    _auth.signOut(); // Sign out dari Firebase Authentication

    Get.offAllNamed(Routes
        .CHOISE); // Navigate ke HomePage dan hapus semua halaman sebelumnya
  }

  Future<void> getHighScore() async {
    try {
      DocumentSnapshot userDoc = await _authCollection.doc(_userToken).get();
      dynamic highScoreEasy = userDoc.get("high score easy");
      dynamic highScoreHard = userDoc.get("high score easy");
      _getStorage.write("high score easy", highScoreEasy);
      _getStorage.write("high score hard", highScoreHard);
    } catch (e) {
      Get.snackbar("Warning", "Cannot Load High Score");
    }
  }
}
