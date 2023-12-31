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
    apiKey: 'AIzaSyDEu49EVLMy2atAQ-q0jtFGP2brIa22c_Q',
    appId: '1:206748342594:web:8ea434a54a4f7c9df1d0db',
    messagingSenderId: '206748342594',
    projectId: 'facetap-24df3',
    authDomain: 'facetap-24df3.firebaseapp.com',
    storageBucket: 'facetap-24df3.appspot.com',
    measurementId: 'G-QMVQM0SLY5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfDJ1J0X7uwIjGiorDheblDkpKvrO8tHU',
    appId: '1:206748342594:android:a2da96ef4d5f180ef1d0db',
    messagingSenderId: '206748342594',
    projectId: 'facetap-24df3',
    storageBucket: 'facetap-24df3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC35kmnW4datEI9cndCl4SM9NrVMfIWgGY',
    appId: '1:206748342594:ios:2950e05562b6094df1d0db',
    messagingSenderId: '206748342594',
    projectId: 'facetap-24df3',
    storageBucket: 'facetap-24df3.appspot.com',
    iosBundleId: 'com.facetap.facetap',
  );
}
