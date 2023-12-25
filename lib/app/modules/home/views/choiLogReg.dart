import 'package:flappy_bird/app/modules/home/views/login_page.dart';
import 'package:flappy_bird/app/modules/home/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Choise extends StatelessWidget {
  const Choise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() => Login());
                  print('Login button pressed');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 171, 83, 11),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20), // Spasi antara tombol
              TextButton(
                onPressed: () {
                  Get.to(() => Register());
                  print('Navigate to Register Page');
                },
                child: Text(
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
