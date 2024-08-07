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
    apiKey: 'AIzaSyDSV28gwat6EaRwufuEL2t5nRe4K_buxSo',
    appId: '1:248208742369:web:86c3d711b01dfdb7f5e4a0',
    messagingSenderId: '248208742369',
    projectId: 'quic-order',
    authDomain: 'quic-order.firebaseapp.com',
    storageBucket: 'quic-order.appspot.com',
    measurementId: 'G-S847B2WDZ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvSUCEyta5nl6tR7UGEEkisWphxKEN5tU',
    appId: '1:248208742369:android:db18d416dbae301ff5e4a0',
    messagingSenderId: '248208742369',
    projectId: 'quic-order',
    storageBucket: 'quic-order.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHKlswQTpd5UCycPlm15Y4tXsVIIkXc0U',
    appId: '1:248208742369:ios:f61dae65c7dce18df5e4a0',
    messagingSenderId: '248208742369',
    projectId: 'quic-order',
    storageBucket: 'quic-order.appspot.com',
    androidClientId: '248208742369-k1mtp56891atnq10gte3c1tja7itf3q1.apps.googleusercontent.com',
    iosClientId: '248208742369-9poldn1cdtncen9irvrqiv9b7cicst8t.apps.googleusercontent.com',
    iosBundleId: 'com.quicorder.quicorder',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHKlswQTpd5UCycPlm15Y4tXsVIIkXc0U',
    appId: '1:248208742369:ios:f61dae65c7dce18df5e4a0',
    messagingSenderId: '248208742369',
    projectId: 'quic-order',
    storageBucket: 'quic-order.appspot.com',
    androidClientId: '248208742369-k1mtp56891atnq10gte3c1tja7itf3q1.apps.googleusercontent.com',
    iosClientId: '248208742369-9poldn1cdtncen9irvrqiv9b7cicst8t.apps.googleusercontent.com',
    iosBundleId: 'com.quicorder.quicorder',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDSV28gwat6EaRwufuEL2t5nRe4K_buxSo',
    appId: '1:248208742369:web:c81dcd4746d2897bf5e4a0',
    messagingSenderId: '248208742369',
    projectId: 'quic-order',
    authDomain: 'quic-order.firebaseapp.com',
    storageBucket: 'quic-order.appspot.com',
    measurementId: 'G-5S1M9F2FT5',
  );

}