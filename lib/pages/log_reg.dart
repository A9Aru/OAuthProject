import "package:android_app/pages/login.dart";
import "package:android_app/pages/register.dart";
import "package:flutter/material.dart";

class LogRegPage extends StatefulWidget {
  const LogRegPage({super.key});

  @override
  State<LogRegPage> createState() => _LogRegPageState();
}

class _LogRegPageState extends State<LogRegPage> {
  bool log_page = true;

  void switchLogReg() {
    setState(() {
      log_page = !log_page;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (log_page) {
      return LoginPage(
        onTap: switchLogReg,
      );
    } else {
      return RegisterPage(
        onTap: switchLogReg,
      );
    }
  }
}
