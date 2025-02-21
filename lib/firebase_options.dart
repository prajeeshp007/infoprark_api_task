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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyA2YxxQll4FY_Anji923M9CT6bTk8ZCTq4',
    appId: '1:439266446750:web:27fd9bbcd99e677ef4da8f',
    messagingSenderId: '439266446750',
    projectId: 'sample-project-5d1e8',
    authDomain: 'sample-project-5d1e8.firebaseapp.com',
    storageBucket: 'sample-project-5d1e8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBA_SAn41iHA28e7FitwS0ZY6vTOMhLChI',
    appId: '1:439266446750:android:30ee6a6931b53694f4da8f',
    messagingSenderId: '439266446750',
    projectId: 'sample-project-5d1e8',
    storageBucket: 'sample-project-5d1e8.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA2YxxQll4FY_Anji923M9CT6bTk8ZCTq4',
    appId: '1:439266446750:web:8318d3994a525a27f4da8f',
    messagingSenderId: '439266446750',
    projectId: 'sample-project-5d1e8',
    authDomain: 'sample-project-5d1e8.firebaseapp.com',
    storageBucket: 'sample-project-5d1e8.appspot.com',
  );
}
