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
    apiKey: 'AIzaSyApbh3ew20v_IUE2mdiOeWyaJIOxA7GO-k',
    appId: '1:754274611695:web:eeda246c2d76287166861a',
    messagingSenderId: '754274611695',
    projectId: 'makarya-android',
    authDomain: 'makarya-android.firebaseapp.com',
    storageBucket: 'makarya-android.appspot.com',
    measurementId: 'G-V79N66EHC4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfolfdQ0XAujfHIiwEWf8Sad8HmP6n1Zs',
    appId: '1:754274611695:android:4f856437ad2a142766861a',
    messagingSenderId: '754274611695',
    projectId: 'makarya-android',
    storageBucket: 'makarya-android.appspot.com',
  );

}