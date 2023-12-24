import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_bird/app/modules/home/views/home_view.dart';
import 'package:flappy_bird/app/modules/home/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(Login()); //Navigate ke Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Succes', 'Login scucces', backgroundColor: Colors.green);
      Get.off(HomeView());
    } catch (err) {
      Get.snackbar('Error', 'Login failed: $err', backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
