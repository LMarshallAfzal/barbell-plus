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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGoBlH5Lh4282VQQ-FEdjL6EKhWXyUTKA',
    appId: '1:672288968973:android:3271f716d375ffcc272044',
    messagingSenderId: '672288968973',
    projectId: 'barbell-plus-d094b',
    databaseURL: 'https://barbell-plus-d094b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'barbell-plus-d094b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVuZFmunpDMIVo__YD073tYnFu5zV63Pw',
    appId: '1:672288968973:ios:f847bfa59699a6a2272044',
    messagingSenderId: '672288968973',
    projectId: 'barbell-plus-d094b',
    databaseURL: 'https://barbell-plus-d094b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'barbell-plus-d094b.appspot.com',
    androidClientId: '672288968973-l2oufroj7sc9vec3tgsuh17ftjk6ajhr.apps.googleusercontent.com',
    iosClientId: '672288968973-mu7govpor0v7l30m4onlsvro5m37kcn1.apps.googleusercontent.com',
    iosBundleId: 'lomatek.barbellplus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVuZFmunpDMIVo__YD073tYnFu5zV63Pw',
    appId: '1:672288968973:ios:f847bfa59699a6a2272044',
    messagingSenderId: '672288968973',
    projectId: 'barbell-plus-d094b',
    databaseURL: 'https://barbell-plus-d094b-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'barbell-plus-d094b.appspot.com',
    androidClientId: '672288968973-l2oufroj7sc9vec3tgsuh17ftjk6ajhr.apps.googleusercontent.com',
    iosClientId: '672288968973-mu7govpor0v7l30m4onlsvro5m37kcn1.apps.googleusercontent.com',
    iosBundleId: 'lomatek.barbellplus',
  );
}
