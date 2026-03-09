import 'package:flutter/material.dart';
import 'package:natthiya_interactivity_exercises/models/question.dart';
import 'package:natthiya_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const QuizApp(),
    );
  }
}

// Sample questions for the quiz
final List<Question> sampleQuestions = [
  Question(
    title: 'Where is this picture?',
    imagePath: 'assets/images/kku.jpg',
    choices: [
      Choice(name: 'Chiang Mai', isCorrect: false, displayColor: const Color(0xFFCC44BB)),
      Choice(name: 'Khon Kaen', isCorrect: true,  displayColor: const Color(0xFFFF9900)),
      Choice(name: 'Bangkok',    isCorrect: false, displayColor: const Color(0xFFFF3377)),
      Choice(name: 'Phuket',     isCorrect: false, displayColor: const Color(0xFF4488FF)),
    ],
  ),
  Question(
    title: 'Where is this picture?',
    imagePath: 'assets/images/landscape.jpg',
    choices: [
      Choice(name: 'Chiang Mai', isCorrect: true,  displayColor: const Color(0xFF664422)),
      Choice(name: 'Khon Kaen',  isCorrect: false, displayColor: const Color(0xFFFF9900)),
      Choice(name: 'Bangkok',    isCorrect: false, displayColor: const Color(0xFFFF3377)),
      Choice(name: 'Phuket',     isCorrect: false, displayColor: const Color(0xFF4488FF)),
    ],
  ),
  Question(
    title: 'Where is this picture?',
    imagePath: 'assets/images/Ann.jpg',
    choices: [
      Choice(name: 'Yaya',    isCorrect: false, displayColor: const Color(0xFFCC44BB)),
      Choice(name: 'Bella',   isCorrect: false, displayColor: const Color(0xFFFF9900)),
      Choice(name: 'Ann',     isCorrect: true,  displayColor: const Color(0xFFFF3377)),
      Choice(name: 'Kimberry', isCorrect: false, displayColor: const Color(0xFF4488FF)),
    ],
  ),
];

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, int?> _selectedAnswers = {};
  Map<int, bool> _questionAnswered = {};
  int resetCounter = 0;

  void _onAnswerSelected(int selectedIndex) {
    final question = sampleQuestions[currentQuestionIndex];
    final previousSelection = _selectedAnswers[currentQuestionIndex];
    final isCorrect = question.choices[selectedIndex].isCorrect;

    setState(() {
      _selectedAnswers[currentQuestionIndex] = selectedIndex;
      _questionAnswered[currentQuestionIndex] = true;

      // Score recalculation: subtract previous correct if any, add new correct
      if (previousSelection != null) {
        final previousChoice = question.choices[previousSelection];
        if (previousChoice.isCorrect) {
          score--;
        }
      }
      if (isCorrect) {
        score++;
      }
    });
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < sampleQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showScoreDialog();
    }
  }

  void _goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete!'),
        content: Text('Your score: $score / ${sampleQuestions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetQuiz();
            },
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _selectedAnswers = {};
      _questionAnswered = {};
      resetCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFirstQuestion = currentQuestionIndex == 0;
    final currentQuestion = sampleQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App by 663040114-3'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Quiz Screen
          Expanded(
            child: QuizScreen(
              key: ValueKey('$resetCounter-$currentQuestionIndex'),
              question: currentQuestion,
              questionIndex: currentQuestionIndex,
              totalQuestions: sampleQuestions.length,
              initialSelectedIndex: _selectedAnswers[currentQuestionIndex],
              isInitiallyAnswered:
                  _questionAnswered[currentQuestionIndex] ?? false,
              onAnswerSelected: _onAnswerSelected,
            ),
          ),

          // Navigation buttons — match screenshots: text-only Previous / Next
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: isFirstQuestion
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.spaceBetween,
              children: [
                // Previous button — hidden on first question
                if (!isFirstQuestion)
                  TextButton(
                    onPressed: _goToPreviousQuestion,
                    child: const Text('Previous'),
                  ),

                // Next button — always visible, triggers score dialog on last
                TextButton(
                  onPressed: _goToNextQuestion,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
