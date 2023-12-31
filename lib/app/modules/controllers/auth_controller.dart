import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_bird/app/components/style/color_local.dart';
import 'package:flappy_bird/app/modules/views/login_page.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _authCollection = FirebaseFirestore.instance.collection("Profile");
  final _storeage = GetStorage();
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    isLoggedIn.value = _storeage.hasData("user_token");
  }

  Future<void> registerUser(String name, String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _authCollection.doc(_auth.currentUser!.uid).set({
        'name': name,
        'email': email,
        'realtime score': 0,
        'high score easy': 0,
        'high score hard': 0,
        'UID': _auth.currentUser!.uid
      });
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: ColorLocal.successColor);
      Get.off(() => const Login()); //Navigate ke Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: ColorLocal.errorColor);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _storeage.write('user_token', _auth.currentUser!.uid);
      Get.snackbar('Succes', 'Login scucces',
          backgroundColor: ColorLocal.successColor);
      isLoggedIn.value = true;
      Get.offAndToNamed(Routes.LEVELSTAGE);
    } catch (err) {
      Get.snackbar('Error', 'Login failed: $err',
          backgroundColor: ColorLocal.errorColor);
    } finally {
      isLoading.value = false;
    }
  }
}
