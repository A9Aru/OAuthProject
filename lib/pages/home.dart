import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 181, 214, 214),
          actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))]),
      backgroundColor: Color.fromARGB(255, 255, 116, 119),
      body: Center(
          child: Text(
        "Logged In!\n User Email:" + user.email!,
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
