import 'package:flutter/material.dart';
import 'package:natthiya_interactivity_exercises/models/question.dart';

class QuizResultScreen extends StatelessWidget {
  final List<Question> questions;
  final Map<int, int?> selectedAnswers;
  final int score;
  final VoidCallback onRestart;

  const QuizResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.score,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // ── Score header ────────────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            color: theme.colorScheme.primaryContainer,
            child: Column(
              children: [
                Text(
                  'Your Score',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$score / ${questions.length}',
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // ── Question review list ────────────────────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: questions.length,
              itemBuilder: (context, i) {
                final question = questions[i];
                // Find the correct choice
                final correctIndex = question.choices
                    .indexWhere((c) => c.isCorrect);
                final correctChoice = question.choices[correctIndex];
                final selectedIdx = selectedAnswers[i];

                // Build subtitle text + color
                String subtitleText;
                Color subtitleColor;

                if (selectedIdx == null) {
                  subtitleText =
                      'Not answered - Correct: ${correctChoice.name}';
                  subtitleColor = Colors.orange;
                } else if (selectedIdx == correctIndex) {
                  subtitleText = '${correctChoice.name} ✓';
                  subtitleColor = Colors.green;
                } else {
                  final answerChoice = question.choices[selectedIdx];
                  subtitleText =
                      '${answerChoice.name} x Should be ${correctChoice.name}';
                  subtitleColor = Colors.red;
                }

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: correctChoice.displayColor,
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      question.title,
                      style: theme.textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      subtitleText,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: subtitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ── Restart button ──────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  foregroundColor: theme.colorScheme.onPrimaryContainer,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Restart',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
