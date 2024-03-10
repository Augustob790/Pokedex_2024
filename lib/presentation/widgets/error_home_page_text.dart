import 'package:flutter/material.dart';

class ErrorHomePageText extends StatelessWidget {
  const ErrorHomePageText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ],
    );
  }
}
