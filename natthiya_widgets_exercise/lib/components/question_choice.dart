// 1. QuestionChoice Widget (lib/components/question_choice.dart)
// Requirements:
// Create a QuestionChoice class that is a StatelessWidget containing:
// name (String) - The choice text to display
// bgColor (Color) - Background color of the choice
// fgColor (Color?) - Optional foreground/text color (nullable)
// Add a const constructor with required parameters for name and bgColor, optional for fgColor
// Implement automatic text color calculation:
// If fgColor is provided, use it
// Otherwise, use ThemeData.estimateBrightnessForColor(bgColor) to determine if background is dark or light
// Use white text for dark backgrounds, black text for light backgrounds
// Return a Container with centered text, background color, appropriate padding, and fixed dimensions (150 x 60)


import 'package:flutter/material.dart';

class QuestionChoice extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color? fgColor;

  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
  });

  @override
  Widget build(BuildContext context) {

    final Color textColor = fgColor ??
        (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? Colors.white
            : Colors.black);

    return Container(
      width: 150, 
      height: 60,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}