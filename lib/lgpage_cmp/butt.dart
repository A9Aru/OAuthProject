import 'package:flutter/material.dart';

class Butt extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const Butt({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 206, 181, 183),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
