import 'package:flutter/material.dart';
import 'package:natthiya_interactivity_exercises/models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreenHome extends StatefulWidget {
  final Question question;
  final int questionIndex;
  final int totalQuestions;
  final int? initialSelectedIndex;
  final bool isInitiallyAnswered;
  final void Function(int selectedIndex) onAnswerSelected;

  // Navigation controls owned by the parent (QuizApp)
  final bool showPreviousButton;
  final bool showNextButton;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onHome;

  const QuizScreenHome({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.initialSelectedIndex,
    required this.isInitiallyAnswered,
    required this.onAnswerSelected,
    required this.showPreviousButton,
    required this.showNextButton,
    required this.onPrevious,
    required this.onNext,
    required this.onHome,
  });

  @override
  State<QuizScreenHome> createState() => _QuizScreenHomeState();
}

class _QuizScreenHomeState extends State<QuizScreenHome> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  void didUpdateWidget(covariant QuizScreenHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Restore previously selected choice when navigating between questions
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.isInitiallyAnswered != widget.isInitiallyAnswered) {
      setState(() {
        selectedIndex = widget.initialSelectedIndex;
      });
    }
  }

  void _handleChoiceTap(int index) {
    setState(() => selectedIndex = index);
    widget.onAnswerSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final question = widget.question;

    return Column(
      children: [
        // Scrollable content area
        Expanded(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Question title — amber to match screenshots
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

                // Choices — 2-column grid
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
                      canSelect: true, // always true — no locking
                      onTap: () => _handleChoiceTap(index),
                    );
                  }),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),

        // ── Navigation row: [Previous] [Home] [Next] ────────────────────────
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Previous — hidden but keeps its layout space via Visibility
              Visibility(
                visible: widget.showPreviousButton,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: TextButton(
                  onPressed: widget.onPrevious,
                  child: const Text('Previous'),
                ),
              ),

              // Home — always visible, always centered
              TextButton(
                onPressed: widget.onHome,
                child: const Text('Home'),
              ),

              // Next — hidden but keeps its layout space via Visibility
              Visibility(
                visible: widget.showNextButton,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: TextButton(
                  onPressed: widget.onNext,
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
