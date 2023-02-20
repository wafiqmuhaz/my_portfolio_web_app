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
    apiKey: 'AIzaSyAGyM6N27ixr5CK3fmz3J1Ej6PnggiF2IQ',
    appId: '1:987913900497:web:585819286ed627528fd0f0',
    messagingSenderId: '987913900497',
    projectId: 'wafiqmuhaz-web-app',
    authDomain: 'wafiqmuhaz-web-app.firebaseapp.com',
    storageBucket: 'wafiqmuhaz-web-app.appspot.com',
    measurementId: 'G-6951S97YFV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC860jhxyEOZEvJRFV3k0v3TO8YJuUKL3k',
    appId: '1:987913900497:android:d34c4bcaa0dca8e68fd0f0',
    messagingSenderId: '987913900497',
    projectId: 'wafiqmuhaz-web-app',
    storageBucket: 'wafiqmuhaz-web-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDA63e4N6UF9m_DXcNIXJ4oxBU8gUkmNQ',
    appId: '1:987913900497:ios:4227c8ed63f190808fd0f0',
    messagingSenderId: '987913900497',
    projectId: 'wafiqmuhaz-web-app',
    storageBucket: 'wafiqmuhaz-web-app.appspot.com',
    iosClientId: '987913900497-uliaeo46fpqp2v5qfdhmftss86vsphdc.apps.googleusercontent.com',
    iosBundleId: 'com.wafiqmuhaz.org.my-portfolio-web-app',
  );
}
