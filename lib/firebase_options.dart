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
    apiKey: 'AIzaSyASjPh7KlIaSrKlbDQJJpnHtwLIcyayxT0',
    appId: '1:583893995349:web:f24ac3cc683e5be1e129dc',
    messagingSenderId: '583893995349',
    projectId: 'chatty-app-ad07e',
    authDomain: 'chatty-app-ad07e.firebaseapp.com',
    storageBucket: 'chatty-app-ad07e.appspot.com',
    measurementId: 'G-2JVXB03ZZK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8llYesoT-u6NEeSGGu8rv3kX4tGO7OzQ',
    appId: '1:670613015475:android:e07e44a04bed037429d9c6',
    messagingSenderId: '670613015475',
    projectId: 'mychatgpt-6d065',
    storageBucket: 'mychatgpt-6d065.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6AA5E6m7dcInc_zA8SNoNm0vVOoDf640',
    appId: '1:583893995349:ios:f792b7eb214e28b4e129dc',
    messagingSenderId: '583893995349',
    projectId: 'chatty-app-ad07e',
    storageBucket: 'chatty-app-ad07e.appspot.com',
    iosBundleId: 'com.example.cahtty',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6AA5E6m7dcInc_zA8SNoNm0vVOoDf640',
    appId: '1:583893995349:ios:62572895584c0a8fe129dc',
    messagingSenderId: '583893995349',
    projectId: 'chatty-app-ad07e',
    storageBucket: 'chatty-app-ad07e.appspot.com',
    iosBundleId: 'com.example.cahtty.RunnerTests',
  );
}