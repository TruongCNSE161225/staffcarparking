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
    apiKey: 'AIzaSyA7ZsDag-052o15aPv6N9knRqo559yyvZM',
    appId: '1:286648231344:android:bd91a34954e3d261816275',
    messagingSenderId: '286648231344',
    projectId: 'parkx-22f01',
    storageBucket: 'parkx-22f01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDoPpN-s1lvr4-w0YzA6TcR5jLoBHKTOw',
    appId: '1:286648231344:ios:64dbe89017f8fddc816275',
    messagingSenderId: '286648231344',
    projectId: 'parkx-22f01',
    storageBucket: 'parkx-22f01.appspot.com',
    androidClientId: '286648231344-74uu1kshrdb6nkg06r2n4tnjamvhvs2g.apps.googleusercontent.com',
    iosClientId: '286648231344-hnjtd4gk5g7lktfltv2vnnjpvmsoh3rt.apps.googleusercontent.com',
    iosBundleId: 'com.example.staffCarparking',
  );
}
