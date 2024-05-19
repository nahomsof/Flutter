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
        return macos;
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
    apiKey: 'AIzaSyAHVr2sjuPw7Be6wmo-QkI-HKmJHwxdQ-g',
    appId: '1:485927776940:web:ccdf0a3fa67f06a9aca509',
    messagingSenderId: '485927776940',
    projectId: 'authentic-50253',
    authDomain: 'authentic-50253.firebaseapp.com',
    storageBucket: 'authentic-50253.appspot.com',
    measurementId: 'G-3YWWC4WXVK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCP_A8uwKQTKPorl02eZ2kx6cF9yBSB-0w',
    appId: '1:485927776940:android:71e1b78b363e94e9aca509',
    messagingSenderId: '485927776940',
    projectId: 'authentic-50253',
    storageBucket: 'authentic-50253.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAa_7lcxhn25TYo6h1qpKtG-PcO7CeUmGs',
    appId: '1:485927776940:ios:bc74e4b6f5888409aca509',
    messagingSenderId: '485927776940',
    projectId: 'authentic-50253',
    storageBucket: 'authentic-50253.appspot.com',
    iosBundleId: 'com.example.authentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAa_7lcxhn25TYo6h1qpKtG-PcO7CeUmGs',
    appId: '1:485927776940:ios:bc74e4b6f5888409aca509',
    messagingSenderId: '485927776940',
    projectId: 'authentic-50253',
    storageBucket: 'authentic-50253.appspot.com',
    iosBundleId: 'com.example.authentication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHVr2sjuPw7Be6wmo-QkI-HKmJHwxdQ-g',
    appId: '1:485927776940:web:3eb96386917ec4efaca509',
    messagingSenderId: '485927776940',
    projectId: 'authentic-50253',
    authDomain: 'authentic-50253.firebaseapp.com',
    storageBucket: 'authentic-50253.appspot.com',
    measurementId: 'G-KKD8QRSY26',
  );

}