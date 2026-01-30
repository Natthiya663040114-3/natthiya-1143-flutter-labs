import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'question_choice.dart';

// Widget that displays a question, an image, and a responsive grid of choices
class QuestionWithChoices extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<QuestionChoice> choices;

  const QuestionWithChoices({
    super.key,
    required this.title,
    required this.imagePath,
    required this.choices,
  });

  @override
  Widget build(BuildContext context) {
    // Check orientation to adjust layout dynamically
    bool portrait = Responsive.isPortrait(context);

    // Main padding for the entire screen content
    return Padding(
      padding: Responsive.getScreenPadding(context),
      child: Column(
        children: [
          // Question Title Section
          Expanded(
            flex: portrait ? 1 : 1,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          // Image Section
          // In landscape, we give it slightly more flex space (2) vs portrait (1)
          Expanded(
            flex: portrait ? 1 : 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          // Choices Grid Section
          // GridView that adapts its aspect ratio and padding based on orientation
          Expanded(
            flex: portrait ? 1 : 3, // More space for grid in landscape
            child: GridView.builder(
              // Larger padding in landscape to utilize the extra width
              padding: portrait
                  ? const EdgeInsets.all(20.0)
                  : const EdgeInsets.all(40.0),
              
              // 2-column grid structure with fixed spacing
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                // Adjust aspect ratio: taller items in portrait, wider in landscape
                childAspectRatio: portrait ? 2.5 : 8.0,
              ),
              itemCount: choices.length,
              itemBuilder: (context, index) {
                return choices[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
