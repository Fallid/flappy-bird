import 'package:flappy_bird/app/components/style/image_local.dart';
import 'package:flappy_bird/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LevelStageView extends StatelessWidget {
  const LevelStageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageLocal.backgroundPage),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Level Stage',
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.GAMEVIEW);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange)),
                child: const Text(
                  "Easy",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.GAMEVIEWLV2);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange)),
                child: const Text(
                  "Hard",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
