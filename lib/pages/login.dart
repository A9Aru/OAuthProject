//import 'dart:js_interop';

import 'package:android_app/lgpage_cmp/butt.dart';
import 'package:android_app/lgpage_cmp/butt_tile.dart';
import 'package:android_app/lgpage_cmp/textf.dart';
import 'package:android_app/pages/forgot.dart';
import 'package:android_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user_control = TextEditingController();

  final pass_control = TextEditingController();

  void incorrectCred(String mess) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 230, 149, 151),
          title: Center(
            child: Text(mess),
          ),
        );
      },
    );
  }

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user_control.text,
        password: pass_control.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        incorrectCred(
            'The Email entered does not belong to any existing account. Kindly check the email or register as a new user.');
      } else if (e.code == 'wrong-password') {
        incorrectCred("The password entered is incorrect.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 116, 119),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

                //Logo
                // const Icon(
                //   Icons.lock,
                //   size: 100,
                // ),
                Image.asset('lib/imgs/logo.png', height: 150),

                const SizedBox(height: 50),

                //Text
                Text(
                  "Welcome to our SDN Project's Login Page!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 20),

                //Username
                TextF(
                    controller: user_control,
                    hintText: 'Email',
                    obscureText: false),

                const SizedBox(height: 20),

                //Password
                TextF(
                    controller: pass_control,
                    hintText: 'Password',
                    obscureText: true),

                const SizedBox(height: 5),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ForgotPage();
                    }));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Butt(
                  text: "Sign In",
                  onTap: signIn,
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtTile(
                      onTap: () => AuthService().googleSignIn(),
                      imagePath: 'lib/imgs/google.png',
                      height: 60,
                      pad: 10,
                    ),
                    SizedBox(width: 10),
                    ButtTile(
                      onTap: () {},
                      imagePath: 'lib/imgs/facebook.png',
                      height: 48,
                      pad: 16,
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New User?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 131, 224),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
