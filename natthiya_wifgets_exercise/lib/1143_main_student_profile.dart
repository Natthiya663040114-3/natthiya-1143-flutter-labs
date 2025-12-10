import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfile());
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String name = 'Natthiya Chakaew';
    const String id = '663040114-3';

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Student Profile")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                id,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
