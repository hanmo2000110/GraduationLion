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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFbn5aSMaFzQWJUWfK_ygFs03gFdT8SV8',
    appId: '1:1092178133208:android:5ed01abd8113d5109597ad',
    messagingSenderId: '1092178133208',
    projectId: 'draduationlion',
    storageBucket: 'draduationlion.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaDut4yNGy_juGRXdBlRn9Hnp7SN8XvNo',
    appId: '1:1092178133208:ios:c0bcb5e7529c49299597ad',
    messagingSenderId: '1092178133208',
    projectId: 'draduationlion',
    storageBucket: 'draduationlion.appspot.com',
    androidClientId: '1092178133208-1p0utmsd7qtq6tg7oppokprkd7cqa9fv.apps.googleusercontent.com',
    iosClientId: '1092178133208-fuk0gsg91qeav4640uoc3kivlptbcn6m.apps.googleusercontent.com',
    iosBundleId: 'com.example.graduationlion',
  );
}
