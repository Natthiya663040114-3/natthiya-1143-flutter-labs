import 'package:flutter/material.dart';
import 'package:natthiya_interactivity_exercises/models/question.dart';
import 'package:natthiya_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen_home.dart';
import 'screens/quiz_result_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverPage(),
        '/quiz': (context) => const QuizApp(),
      },
    );
  }
}

// ─── Cover Page ───────────────────────────────────────────────────────────────

class QuizCoverPage extends StatelessWidget {
  const QuizCoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const Spacer(flex: 3),
              Icon(
                Icons.quiz_outlined,
                size: 120,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Welcome to the Quiz App MJ',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'By Natthiya 663040114-3',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 4),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/quiz'),
                  child: const Text('Start', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Questions data ───────────────────────────────────────────────────────────

final List<Question> sampleQuestions = [
  Question(
    title: 'Where is this picture?',
    imagePath: 'assets/images/kku.jpg',
    choices: [
      Choice(name: 'Chiang Mai', isCorrect: false, displayColor: const Color(0xFFCC44BB)),
      Choice(name: 'Khon Kaen',  isCorrect: true,  displayColor: const Color(0xFFFF9900)),
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
      Choice(name: 'Yaya',     isCorrect: false, displayColor: const Color(0xFFCC44BB)),
      Choice(name: 'Bella',    isCorrect: false, displayColor: const Color(0xFFFF9900)),
      Choice(name: 'Ann',      isCorrect: true,  displayColor: const Color(0xFFFF3377)),
      Choice(name: 'Kimberry', isCorrect: false, displayColor: const Color(0xFF4488FF)),
    ],
  ),
];

// ─── Quiz App (state manager) ─────────────────────────────────────────────────

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

      if (previousSelection != null) {
        if (question.choices[previousSelection].isCorrect) score--;
      }
      if (isCorrect) score++;
    });
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < sampleQuestions.length - 1) {
      setState(() => currentQuestionIndex++);
    } else {
      _showResultsScreen();
    }
  }

  void _goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() => currentQuestionIndex--);
    }
  }

  void _goHome() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  void _showResultsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          questions: sampleQuestions,
          selectedAnswers: Map.from(_selectedAnswers),
          score: score,
          onRestart: _handleRestart,
        ),
      ),
    );
  }

  void _handleRestart() {
    // Reset all state, then pop the ResultsScreen and redirect to cover page
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _selectedAnswers = {};
      _questionAnswered = {};
      resetCounter++;
    });
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final isFirst = currentQuestionIndex == 0;
    final currentQuestion = sampleQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App by 663040114-3'),
        centerTitle: true,
      ),
      body: QuizScreenHome(
        key: ValueKey('$resetCounter-$currentQuestionIndex'),
        question: currentQuestion,
        questionIndex: currentQuestionIndex,
        totalQuestions: sampleQuestions.length,
        initialSelectedIndex: _selectedAnswers[currentQuestionIndex],
        isInitiallyAnswered: _questionAnswered[currentQuestionIndex] ?? false,
        onAnswerSelected: _onAnswerSelected,
        showPreviousButton: !isFirst,
        showNextButton: true,
        onPrevious: _goToPreviousQuestion,
        onNext: _goToNextQuestion,
        onHome: _goHome,
      ),
    );
  }
}
