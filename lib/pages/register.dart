//import 'dart:js_interop';

import 'package:android_app/lgpage_cmp/butt.dart';
import 'package:android_app/lgpage_cmp/butt_tile.dart';
import 'package:android_app/lgpage_cmp/textf.dart';
import 'package:android_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final user_control = TextEditingController();
  final pass_control = TextEditingController();
  final confirm_pass_control = TextEditingController();

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

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (pass_control.text == confirm_pass_control.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user_control.text,
          password: pass_control.text,
        );
      } else {
        incorrectCred("Passwords do not match.");
      }
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      if (e.code == 'email-already-in-use') {
        incorrectCred("Email Already Exists");
      } else if (e.code == 'weak-password') {
        incorrectCred('Password Strength: Weak');
      } else {
        incorrectCred(e.code);
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
                  "Create Account",
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

                const SizedBox(height: 20),

                //Confirm Password
                TextF(
                    controller: confirm_pass_control,
                    hintText: 'Confirm Password',
                    obscureText: true),

                const SizedBox(height: 10),

                Butt(
                  text: "Sign Up",
                  onTap: signUp,
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
                      "Already Have an Account?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login",
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
