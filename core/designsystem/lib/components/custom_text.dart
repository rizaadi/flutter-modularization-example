import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.value, {
    super.key,
  });
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
