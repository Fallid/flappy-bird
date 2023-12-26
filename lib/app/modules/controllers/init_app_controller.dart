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
      dynamic highScore = userDoc.get("high score");
      _storeHighScore.write("high score", highScore);
    } catch (e) {
      Get.snackbar("Warning", "Cannot Load High Score");
    }
  }
}
