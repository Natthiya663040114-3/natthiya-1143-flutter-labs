import 'package:flutter/material.dart';

class QuestionChoice extends StatefulWidget {
  final String name;
  final Color bgColor;
  final Color fgColor;
  final bool correct;

  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    required this.fgColor,
    this.correct = false,
  });

  @override
  State<QuestionChoice> createState() => _QuestionChoiceState();
}

class _QuestionChoiceState extends State<QuestionChoice> {
  bool _isTapped = false;
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.bgColor;
  }

  void _handleTap() {
    // If already tapped, don't allow another tap.
    if (_isTapped) return;

    setState(() {
      _isTapped = true;
      // Change color based on whether the answer is correct or not.
      _currentColor = widget.correct ? Colors.green : Colors.red;
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.correct ? 'Correct!' : 'Incorrect'),
        content: Text('Your score is ${widget.correct ? 1 : 0}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _currentColor,
        ),
        alignment: Alignment.center,
        child: Text(
          widget.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: widget.fgColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
