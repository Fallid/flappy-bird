import 'package:flappy_bird/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => HomeView());
              },
              child: Text('Easy'),
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 20)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => HomeView());
              },
              child: Text('Normal'),
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 20)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => HomeView());
              },
              child: Text('Hard'),
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 20)),
            ),
          ],
        ),
      ),
    );
  }
}
