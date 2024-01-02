import 'package:firebase_core/firebase_core.dart';
import 'package:flappy_bird/app/modules/controllers/auth_controller.dart';
import 'package:flappy_bird/firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      if (kDebugMode) {}
      return GetMaterialApp(
        title: "Flappy Bird: Remake",
        initialRoute: _authController.isLoggedIn.value
            ? AppPages.LOGGED
            : AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}
