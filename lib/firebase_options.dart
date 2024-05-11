// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAfuU8xBfVw_QLzPUC7NOPAlb3pttZ36pc',
    appId: '1:105416207694:web:ed9897c9bdad7e0db4821f',
    messagingSenderId: '105416207694',
    projectId: 'todoapptask-cea97',
    authDomain: 'todoapptask-cea97.firebaseapp.com',
    storageBucket: 'todoapptask-cea97.appspot.com',
    measurementId: 'G-E22LE0FKNL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4lq5B8PP6si4SuvqIJ-35kmQw2-39jMY',
    appId: '1:105416207694:android:7028f65abce7815cb4821f',
    messagingSenderId: '105416207694',
    projectId: 'todoapptask-cea97',
    storageBucket: 'todoapptask-cea97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChk1Yrewj2-uyf4A1Ri0LIsOaoHHHaHvg',
    appId: '1:105416207694:ios:6ace4d373702ada7b4821f',
    messagingSenderId: '105416207694',
    projectId: 'todoapptask-cea97',
    storageBucket: 'todoapptask-cea97.appspot.com',
    iosBundleId: 'com.flutter.mmcTask',
  );
}
