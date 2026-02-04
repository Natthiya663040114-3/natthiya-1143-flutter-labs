import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final Color color;

  const StarRating({
    super.key,
    required this.rating,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(Icons.star, color: color, size: 16);
        } else if (index < rating && (rating - index) >= 0.5) {
          return Icon(Icons.star_half, color: color, size: 16);
        } else {
          return Icon(Icons.star_border, color: color, size: 16);
        }
      }),
    );
  }
}
