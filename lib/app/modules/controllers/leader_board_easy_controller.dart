import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LeaderBoardEasyController extends GetxController {
  RxList<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;

  Future<void> getData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('Profile').get();

      dataList.assignAll(querySnapshot.docs.map((doc) => doc.data()));
      dataList.sort((a, b) =>
          (b['high score easy'] ?? 0).compareTo(a['high score easy'] ?? 0));
      print(dataList);
    } catch (e) {
      // Handle errors
      print(e.toString());
    }
  }
}
