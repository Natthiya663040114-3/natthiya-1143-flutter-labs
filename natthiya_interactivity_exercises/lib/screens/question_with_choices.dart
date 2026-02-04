import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../components/question_choice.dart';

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
    // We check if the device is in portrait mode to decide the layout.
    // Portrait: Vertical layout. Landscape: More horizontal space.
    bool portrait = Responsive.isPortrait(context);

    return Padding(
      // In landscape, we add more side padding to center the content better.
      padding: portrait 
          ? const EdgeInsets.all(16.0) 
          : const EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
      child: Column(
        children: [
          // Question Title Section
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          // Image Section - Increased size, Square (No ClipRRect)
          Expanded(
            flex: portrait ? 5 : 4, 
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          
          // Choices Section
          // We use a Column of Rows instead of GridView to avoid aspect ratio issues.
          // This ensures the text fits and buttons look proportional.
          Expanded(
            flex: portrait ? 3 : 3,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: choices[0]),
                      const SizedBox(width: 10),
                      Expanded(child: choices[1]),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: choices[2]),
                      const SizedBox(width: 10),
                      Expanded(child: choices[3]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
