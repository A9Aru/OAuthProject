import "package:android_app/lgpage_cmp/butt.dart";
import "package:android_app/lgpage_cmp/textf.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class ForgotPage extends StatefulWidget {
  ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final user_control = TextEditingController();

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

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: user_control.text);
      incorrectCred("Password Reset Link Sent!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user_not_found') {
        incorrectCred("This email does not belong to any account");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 181, 214, 214),
      ),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Enter you email below to receive a link to reset your password.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextF(
                    controller: user_control,
                    hintText: 'Email',
                    obscureText: false),

                const SizedBox(height: 20),

                // MaterialButton(
                //   onPressed: resetPassword,
                //   child: Text("Reset Password"),
                // ),
                Butt(
                  text: "Reset Password",
                  onTap: resetPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
