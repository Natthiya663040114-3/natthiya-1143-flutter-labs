import 'package:flutter/material.dart';
import 'screens/question_with_choices.dart';
import 'components/question_choice.dart';

void main() {
  runApp(const MainQuizCheckAnswer());
}

class MainQuizCheckAnswer extends StatelessWidget {
  const MainQuizCheckAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App by 663040114-3', // User's ID from context
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App by 663040114-3'),
          centerTitle: true,
          backgroundColor: Colors.purple[50],
        ),
        body: SafeArea(
          child: QuestionWithChoices(
            // The main data for the quiz: title, image, and list of choices.
            // Each choice has a name, background color, and correctness flag.
            title: "Where is this picture?",
            imagePath: "assets/images/kku.jpg", 
            choices: [
              QuestionChoice(
                name: "Chiang Mai University",
                bgColor: Colors.purple, 
                fgColor: Colors.white,
                correct: false,
              ),
              QuestionChoice(
                name: "Khon Kaen University",
                bgColor: Colors.green[800]!, // KKU's signature color
                fgColor: Colors.white,
                correct: true, // This is the correct answer
              ),
              QuestionChoice(
                name: "Chulalongkorn University",
                bgColor: Colors.pink,
                fgColor: Colors.white,
                correct: false,
              ),
              QuestionChoice(
                name: "Mahidol University",
                bgColor: Colors.blue[900]!,
                fgColor: Colors.white,
                correct: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
