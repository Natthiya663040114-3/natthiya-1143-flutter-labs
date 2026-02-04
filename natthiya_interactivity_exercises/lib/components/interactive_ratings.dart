import 'package:flutter/material.dart';

class InteractiveRatings extends StatefulWidget {
  final int totalStars;
  final double starSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  const InteractiveRatings({
    super.key,
    this.totalStars = 5,
    this.starSize = 24.0,
    this.spacing = 4.0,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  State<InteractiveRatings> createState() => _InteractiveRatingsState();
}

class _InteractiveRatingsState extends State<InteractiveRatings> {
  int _currentRating = 0;

  void _handleTap(int index) {
    setState(() {
      _currentRating = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.totalStars, (index) {
        return GestureDetector(
          onTap: () => _handleTap(index),
          child: Container(
            margin: EdgeInsets.only(right: index < widget.totalStars - 1 ? widget.spacing : 0),
            child: Icon(
              Icons.star,
              size: widget.starSize,
              color: index < _currentRating ? widget.activeColor : widget.inactiveColor,
            ),
          ),
        );
      }),
    );
  }
}
