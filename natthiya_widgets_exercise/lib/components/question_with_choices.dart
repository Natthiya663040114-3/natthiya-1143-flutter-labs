import 'package:flutter/material.dart';
import 'question_choice.dart';

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
    return Column(
      children: [
        Expanded(
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

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              imagePath, 
              fit: BoxFit.contain
            ),
          ),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [choices[0], choices[1]],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [choices[2], choices[3]],
              ),
            ],
          ),
        ),
      ],
    );
  }
}