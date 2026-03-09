import 'package:flutter/material.dart';
import 'package:natthiya_interactivity_exercises/models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final int questionIndex;
  final int totalQuestions;
  final int? initialSelectedIndex;
  final bool isInitiallyAnswered;
  final void Function(int selectedIndex) onAnswerSelected;

  const QuizScreen({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.initialSelectedIndex,
    required this.isInitiallyAnswered,
    required this.onAnswerSelected,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  void didUpdateWidget(covariant QuizScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update state when navigating to a different question
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.isInitiallyAnswered != widget.isInitiallyAnswered) {
      setState(() {
        selectedIndex = widget.initialSelectedIndex;
      });
    }
  }

  void _handleChoiceTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onAnswerSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final question = widget.question;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question title — large amber text matching screenshots
          Text(
            question.title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0xFFFFAA00),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Question image
          if (question.imagePath.isNotEmpty) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                question.imagePath,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Choices grid — 2 columns
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.4,
            children: List.generate(question.choices.length, (index) {
              return QuestionChoiceCard(
                choice: question.choices[index],
                isSelected: selectedIndex == index,
                canSelect: true, // Always true — no locking
                onTap: () => _handleChoiceTap(index),
              );
            }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
