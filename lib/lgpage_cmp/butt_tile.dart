import 'package:flutter/material.dart';

class ButtTile extends StatelessWidget {
  final String imagePath;
  final double height;
  final double pad;
  final Function()? onTap;

  const ButtTile({
    super.key,
    required this.imagePath,
    required this.height,
    required this.pad,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(pad),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
        ),
        child: Image.asset(imagePath, height: height),
      ),
    );
  }
}
