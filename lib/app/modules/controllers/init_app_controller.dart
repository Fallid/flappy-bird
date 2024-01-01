import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitAppController extends GetxController {
  final CollectionReference _authCollection =
      FirebaseFirestore.instance.collection("Profile");
  final _userToken = GetStorage().read("user_token");
  final _storeHighScore = GetStorage();

  Future<void> getHighScore() async {
    try {
      DocumentSnapshot userDoc = await _authCollection.doc(_userToken).get();
      dynamic highScoreEasy = userDoc.get("high score easy");
      dynamic highScoreHard = userDoc.get("high score easy");
      _storeHighScore.write("high score easy", highScoreEasy);
      _storeHighScore.write("high score hard", highScoreHard);
    } catch (e) {
      Get.snackbar("Warning", "Cannot Load High Score");
    }
  }
}
