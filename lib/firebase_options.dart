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
    apiKey: 'AIzaSyC1HpAtKnbiNqtAJrn_PUh5ZyUBRT58wXc',
    appId: '1:194790272509:web:9be06aa8f10f1c11febd94',
    messagingSenderId: '194790272509',
    projectId: 'vchat-618cd',
    authDomain: 'vchat-618cd.firebaseapp.com',
    storageBucket: 'vchat-618cd.firebasestorage.app',
    measurementId: 'G-Q3C01VXZG4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0U4VUZLX8oOWlBQhcxx1M57Ogt9kHhNs',
    appId: '1:194790272509:android:00d529a8024424dffebd94',
    messagingSenderId: '194790272509',
    projectId: 'vchat-618cd',
    storageBucket: 'vchat-618cd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC01z0ZLZ_WXqVGEEX08DPlo_AZkCr3GeE',
    appId: '1:194790272509:ios:d807bc2c53b7c134febd94',
    messagingSenderId: '194790272509',
    projectId: 'vchat-618cd',
    storageBucket: 'vchat-618cd.firebasestorage.app',
    iosBundleId: 'com.example.vchat',
  );
}