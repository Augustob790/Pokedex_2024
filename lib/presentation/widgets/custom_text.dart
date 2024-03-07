import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.fontSize = 20, this.colors = Colors.white});

  final String text;
  final double? fontSize;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Google',
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: colors),
    );
  }
}
