import 'package:flappy_bird/app/modules/home/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 87, 187, 209),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              SizedBox(height: 16),
              Obx(() {
                return ElevatedButton(
                  onPressed: _authController.isLoading.value
                      ? null
                      : () {
                          _authController.loginUser(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                  child: _authController.isLoading.value
                      ? CircularProgressIndicator()
                      : Text('Login', style: TextStyle(color: Colors.black)),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
