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
    apiKey: 'AIzaSyCQXjuxUlFfUr-blXWFDZWLZCLrfc-HN-M',
    appId: '1:647721611130:web:b3e0076039c4d48a0cb0c3',
    messagingSenderId: '647721611130',
    projectId: 'hookedup-814bc',
    authDomain: 'hookedup-814bc.firebaseapp.com',
    storageBucket: 'hookedup-814bc.firebasestorage.app',
    measurementId: 'G-LDWY68QPR7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC52fglp0D3Jp6kJHl8q1eJZnVlNhDsDGQ',
    appId: '1:647721611130:android:830d39a21ccdef930cb0c3',
    messagingSenderId: '647721611130',
    projectId: 'hookedup-814bc',
    storageBucket: 'hookedup-814bc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAn67nWUtaOxCraaXy0ef1d9II0A1l8Q-A',
    appId: '1:647721611130:ios:56950fb99eb1e4100cb0c3',
    messagingSenderId: '647721611130',
    projectId: 'hookedup-814bc',
    storageBucket: 'hookedup-814bc.firebasestorage.app',
    iosBundleId: 'com.example.hookedUp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAn67nWUtaOxCraaXy0ef1d9II0A1l8Q-A',
    appId: '1:647721611130:ios:56950fb99eb1e4100cb0c3',
    messagingSenderId: '647721611130',
    projectId: 'hookedup-814bc',
    storageBucket: 'hookedup-814bc.firebasestorage.app',
    iosBundleId: 'com.example.hookedUp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCQXjuxUlFfUr-blXWFDZWLZCLrfc-HN-M',
    appId: '1:647721611130:web:7ede8d57f29cb6760cb0c3',
    messagingSenderId: '647721611130',
    projectId: 'hookedup-814bc',
    authDomain: 'hookedup-814bc.firebaseapp.com',
    storageBucket: 'hookedup-814bc.firebasestorage.app',
    measurementId: 'G-JH7Q5G48QZ',
  );
}