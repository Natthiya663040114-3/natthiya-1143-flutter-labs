import 'package:flutter/material.dart';
import 'models/question.dart';
import 'models/choice.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _resetCounter = 0;
  bool _questionAnswered = false;

  final List<Question> _questions = [
    const Question(
      title: 'Where is this picture?',
      imagePath: 'assets/images/kku.jpg',
      choices: [
        Choice(name: 'Chiang Mai', isCorrect: true, displayColor: Colors.purpleAccent),
        Choice(name: 'Khon Kaen', isCorrect: false, displayColor: Colors.orangeAccent),
        Choice(name: 'Bangkok', isCorrect: false, displayColor: Colors.pinkAccent),
        Choice(name: 'Phuket', isCorrect: false, displayColor: Colors.blueAccent),
      ],
    ),

  ];

  void _handleAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        _score++;
      }
      _questionAnswered = true;
    });
  }

  void _handleNext() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _questionAnswered = false;
      });
    } else {
      _showResultDialog();
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _questionAnswered = false;
      _resetCounter++;
    });
    // Use the navigator key to pop the dialog
    _navigatorKey.currentState?.pop(); 
  }

  void _showResultDialog() {
    // Check if context is valid, though navigatorKey.currentContext is better here
    final context = _navigatorKey.currentContext;
    if (context == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete!'),
        content: Text('Your score: $_score / ${_questions.length}'),
        actions: [
          TextButton(
            onPressed: _restartQuiz,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey, // Add this
      title: 'Quiz App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App by 663040114-3'),
          centerTitle: true,
        ),
        body: QuizScreen(
          key: ValueKey('$_currentQuestionIndex$_resetCounter'),
          question: _questions[_currentQuestionIndex],
          onAnswer: _handleAnswer,
          showNextButton: _questionAnswered,
          onNext: _handleNext,
        ),
      ),
    );
  }
}
