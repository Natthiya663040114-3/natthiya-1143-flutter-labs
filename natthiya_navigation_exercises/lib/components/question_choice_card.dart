import 'package:flutter/material.dart';
import 'package:natthiya_interactivity_exercises/models/choice.dart';

class QuestionChoiceCard extends StatelessWidget {
  final Choice choice;
  final bool isSelected;
  final bool canSelect;
  final VoidCallback onTap;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.canSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Use primaryContainer highlight on selection; otherwise use the choice's
    // own displayColor to reproduce the colourful grid shown in the screenshots.
    final backgroundColor = isSelected
        ? theme.colorScheme.primaryContainer
        : choice.displayColor;
    final textColor = isSelected
        ? theme.colorScheme.onPrimaryContainer
        : Colors.white;

    return GestureDetector(
      onTap: canSelect ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : Colors.transparent,
            width: isSelected ? 2 : 0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              choice.name,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: textColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
