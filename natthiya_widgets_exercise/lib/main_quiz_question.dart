import 'package:flutter/material.dart';
import 'components/question_choice.dart';
import 'components/question_with_choices.dart';

void main() {
  const String appTitle = "Quiz App by 663040114-3";
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
        ),
        body: const QuestionWithChoices(
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
  );
}