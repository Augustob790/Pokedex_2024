// ignore_for_file: equal_elements_in_set, use_super_parameters

import 'package:flutter/material.dart';
import 'custom_text.dart'; 

class CustomColumnWidget extends StatelessWidget {
  const CustomColumnWidget({
    super.key,
    required this.title,
    required this.title1,
    this.title2,
    this.title3,
    required this.text1,
    this.text2,
    this.text3,
    required this.colors,
    this.bio,
  });
  
  final String title;
  final String title1;
  final String? title2;
  final String? title3;
  final String text1;
  final String? text2;
  final String? text3;
  final Color colors;
  final bool? bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        CustomText(
          text: title,
          fontSize: 16,
          colors: colors,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title1,
              fontSize: 14,
              colors: Colors.black54,
            ),
            CustomText(
              text: text1,
              fontSize: 14,
              colors: Colors.black,
            ),
          ],
        ),
       if(bio == true)...{
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title2 ?? "",
              fontSize: 14,
              colors: Colors.black54,
            ),
            CustomText(
              text: text2 ?? "",
              fontSize: 14,
              colors: Colors.black,
            ),
          ],
        ),
        Container(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title3 ?? "",
              fontSize: 14,
              colors: Colors.black54,
            ),
            CustomText(
              text: text3 ?? "",
              fontSize: 14,
              colors: Colors.black,
            ),
          ],
        ),
       },
      const SizedBox(height: 5),
      ],
    );
  }
}
