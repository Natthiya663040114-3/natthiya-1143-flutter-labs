import 'package:flutter/material.dart';
import 'components/question_choice.dart';
import 'components/question_choices_responsive.dart';

// Main entry point for the Responsive Quiz App
void main() {
  const String appTitle = "Quiz App by 663040114-3";
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      
      // Theme configuration
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      // Dark theme support
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      
      // Main Application Skeleton
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
        ),
        // SafeArea ensures content doesn't overlap with system UI (notches, etc.)
        body: const SafeArea(
          child: QuestionWithChoices(
            title: "Where is this picture?",
            imagePath: "assets/images/kku.jpg",
            choices: [
              QuestionChoice(name: "Chiang Mai University", bgColor: Colors.purpleAccent),
              QuestionChoice(name: "Khon Kaen University", bgColor: Colors.orange),
              QuestionChoice(name: "Chulalongkorn University", bgColor: Colors.pinkAccent),
              QuestionChoice(name: "Mahidol University", bgColor: Colors.blueAccent),
            ],
          ),
        ),
      ),
    ),
  );
}
