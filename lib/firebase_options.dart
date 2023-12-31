// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAx0Dia6lS6jUF7PYQ0faHDFng7G1GBbNo',
    appId: '1:921328401660:web:e3fc660c6ee5ed9ab0ab79',
    messagingSenderId: '921328401660',
    projectId: 'flappy-bird-e7f41',
    authDomain: 'flappy-bird-e7f41.firebaseapp.com',
    storageBucket: 'flappy-bird-e7f41.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7J6nsmDPZUtGWKDar_yLwDIdnd2ET8TM',
    appId: '1:921328401660:android:7ee46430ff17219cb0ab79',
    messagingSenderId: '921328401660',
    projectId: 'flappy-bird-e7f41',
    storageBucket: 'flappy-bird-e7f41.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfcyn6m3cgb2CVTutJYUZXGjJRDpLCG1A',
    appId: '1:921328401660:ios:3dadf82083b87a4bb0ab79',
    messagingSenderId: '921328401660',
    projectId: 'flappy-bird-e7f41',
    storageBucket: 'flappy-bird-e7f41.appspot.com',
    iosBundleId: 'com.umm.flappybird.flappyBird',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfcyn6m3cgb2CVTutJYUZXGjJRDpLCG1A',
    appId: '1:921328401660:ios:4f7ecbc4871c0106b0ab79',
    messagingSenderId: '921328401660',
    projectId: 'flappy-bird-e7f41',
    storageBucket: 'flappy-bird-e7f41.appspot.com',
    iosBundleId: 'com.umm.flappybird.flappyBird.RunnerTests',
  );
}
