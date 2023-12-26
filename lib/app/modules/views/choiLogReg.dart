import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/modules/views/login_page.dart';
import 'package:flappy_bird/app/modules/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Choise extends StatelessWidget {
  const Choise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageLocal.backgroundPage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const Login());
                  print('Login button pressed');
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20.h), // Spasi antara tombol
              TextButton(
                onPressed: () {
                  Get.to(() => const Register());
                  print('Navigate to Register Page');
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
