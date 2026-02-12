import 'package:flutter/material.dart';
import '../models/choice.dart';

class QuestionChoiceCard extends StatefulWidget {
  final Choice choice;
  final bool canSelect;
  final bool isSelected;
  final VoidCallback? onSelected;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    this.canSelect = true,
    this.isSelected = false,
    this.onSelected,
  });

  @override
  State<QuestionChoiceCard> createState() => _QuestionChoiceCardState();
}

class _QuestionChoiceCardState extends State<QuestionChoiceCard> {
  @override
  Widget build(BuildContext context) {
    Color bgColor = widget.choice.displayColor;

    if (widget.isSelected) {
      bgColor = widget.choice.isCorrect ? Colors.green : Colors.red;
    }

    return GestureDetector(
      onTap: widget.canSelect && widget.onSelected != null
          ? widget.onSelected
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
          border: widget.isSelected
              ? Border.all(color: Colors.white, width: 3)
              : null, // Add a border to highlight selection if needed, or based on UX
        ),
        alignment: Alignment.center,
        child: Text(
          widget.choice.name,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
