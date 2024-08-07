import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:quicorder/components/sign_in_button.dart';
import 'package:quicorder/pages/choice.dart'; // Assuming you have a Home page

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 34, 139, 34), // Change status bar color here
    ));

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return const Choice(); // Navigate to Home if the user is signed in
        } else {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "QuicOrder",
                      style: GoogleFonts.oxygen(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SignInButton(
                      text: "Sign in with Google",
                      textColor: Colors.black,
                      color: Colors.white,
                      onPressed: () {
                        _signInWithGoogle(context);
                      },
                      imagePath: 'assets/google.png', // Replace with your actual image asset path
                      imageWidth: 60, // Provide desired image width
                      imageHeight: 35, // Provide desired image height
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: "248208742369-okuhc1iav1m6a2286vp80alfj7dihda1.apps.googleusercontent.com", // Replace with your OAuth 2.0 client ID
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );

      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }
}
