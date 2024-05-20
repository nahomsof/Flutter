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
    apiKey: 'AIzaSyAgjAxqg8iK4oxpPLuB8gOmr3hh8edzLyY',
    appId: '1:827003977541:web:d047aff965c5011c39082c',
    messagingSenderId: '827003977541',
    projectId: 'onlinenote-7bbe3',
    authDomain: 'onlinenote-7bbe3.firebaseapp.com',
    storageBucket: 'onlinenote-7bbe3.appspot.com',
    measurementId: 'G-R1ZYR0FQ1P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFIMP0iNRru155R22MzSfilj1VbMEw0VU',
    appId: '1:827003977541:android:185b1ed1157495f539082c',
    messagingSenderId: '827003977541',
    projectId: 'onlinenote-7bbe3',
    storageBucket: 'onlinenote-7bbe3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-BpK7jF8Kp3FEDZ0GzcorxbssBuFfVjQ',
    appId: '1:827003977541:ios:ef391a2d93283d7739082c',
    messagingSenderId: '827003977541',
    projectId: 'onlinenote-7bbe3',
    storageBucket: 'onlinenote-7bbe3.appspot.com',
    iosBundleId: 'com.example.onlineDatabase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-BpK7jF8Kp3FEDZ0GzcorxbssBuFfVjQ',
    appId: '1:827003977541:ios:ef391a2d93283d7739082c',
    messagingSenderId: '827003977541',
    projectId: 'onlinenote-7bbe3',
    storageBucket: 'onlinenote-7bbe3.appspot.com',
    iosBundleId: 'com.example.onlineDatabase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAgjAxqg8iK4oxpPLuB8gOmr3hh8edzLyY',
    appId: '1:827003977541:web:9d363b54616013ae39082c',
    messagingSenderId: '827003977541',
    projectId: 'onlinenote-7bbe3',
    authDomain: 'onlinenote-7bbe3.firebaseapp.com',
    storageBucket: 'onlinenote-7bbe3.appspot.com',
    measurementId: 'G-NQTTHSV3W9',
  );

}