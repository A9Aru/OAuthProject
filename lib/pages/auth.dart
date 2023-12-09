import "package:android_app/pages/home.dart";
import "package:android_app/pages/log_reg.dart";
import "package:android_app/pages/login.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LogRegPage();
          }
        },
      ),
    );
  }
}
