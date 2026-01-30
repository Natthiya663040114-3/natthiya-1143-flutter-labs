// components/ratings.dart
// Widget แสดงแถบดาวคะแนน (Rating Bar) จำนวน 5 ดวง
// สร้างจาก Row ที่ประกอบด้วย Icon(Icons.star) เรียงต่อกัน
// สามารถกำหนดสีของดาวที่ให้คะแนน (ratingColor) 
// และสีของดาวที่เหลือ (defaultColor) ผ่านพารามิเตอร์ได้

import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final Color defaultColor;
  final Color ratingColor;

  const Ratings({
    super.key,
    required this.defaultColor,
    required this.ratingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: defaultColor),
      ],
    );
  }
}
