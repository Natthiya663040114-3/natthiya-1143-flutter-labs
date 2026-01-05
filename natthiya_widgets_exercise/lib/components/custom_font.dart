import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomFont({
    super.key,
    required this.text,
    this.fontFamily,
    this.fontSize = 24.0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.blue[900],
        ),
      ),
    );
  }
}