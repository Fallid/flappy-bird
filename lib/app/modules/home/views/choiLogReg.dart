import 'package:flappy_bird/app/modules/home/views/login_page.dart';
import 'package:flappy_bird/app/modules/home/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Choise extends StatelessWidget {
  const Choise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => Login());
                print('Login button pressed');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20), // Spasi antara tombol
            TextButton(
              onPressed: () {
                Get.to(() => Register());
                print('Navigate to Register Page');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}