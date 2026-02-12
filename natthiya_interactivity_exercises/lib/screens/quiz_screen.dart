import 'package:flutter/material.dart';
import '../models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final ValueChanged<bool>? onAnswer;
  final bool showNextButton;
  final VoidCallback? onNext;

  const QuizScreen({
    super.key,
    required this.question,
    this.onAnswer,
    this.showNextButton = false,
    this.onNext,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? _selectedIndex;
  bool _selectionMade = false;

  void _handleChoiceSelected(int index) {
    if (_selectionMade) return; // Prevent changing answer

    setState(() {
      _selectedIndex = index;
      _selectionMade = true;
    });

    final isCorrect = widget.question.choices[index].isCorrect;
    widget.onAnswer?.call(isCorrect);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            widget.question.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.brown[900],
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 100),
          // Using aspect ratio to keep image consistently sized or perform specific layout
          // Assuming simple image display for now as per previous labs
          if (widget.question.imagePath.isNotEmpty)
            Image.asset(
              widget.question.imagePath,
              height: 200,
              width: 350,
              fit: BoxFit.cover,
            ),
          const SizedBox(height: 100),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.5, // Adjust as needed
            ),
            itemCount: widget.question.choices.length,
            itemBuilder: (context, index) {
              final choice = widget.question.choices[index];
              return QuestionChoiceCard(
                choice: choice,
                canSelect: !_selectionMade,
                isSelected: _selectedIndex == index,
                onSelected: () => _handleChoiceSelected(index),
              );
            },
          ),
          const SizedBox(height: 70),
          if (widget.showNextButton)
            ElevatedButton(
              onPressed: widget.onNext,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 15),
              ),
              child: const Text('Next'),
            ),
          const SizedBox(height: 50
          ),
        ],
      ),
    );
  }
}
