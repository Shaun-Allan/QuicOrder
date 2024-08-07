import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quicorder/inheritance/data_hub.dart';
import 'firebase_options.dart';

import 'package:quicorder/pages/login.dart';

import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DataState(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.blueAccent,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0
                )
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color.fromARGB(100, 206, 243, 206)
            )
        ),
        title: "QuicOrder",
        home: Login(),
      ),
    );
  }
}
