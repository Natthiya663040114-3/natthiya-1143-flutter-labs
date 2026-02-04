import 'package:flutter/material.dart';
import 'models/faculty_model.dart';
import 'screens/faculty_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KKU Faculty List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const FacultyListScreen(),
    );
  }
}

class FacultyListScreen extends StatelessWidget {
  const FacultyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FacultyModel> faculties = FacultyModel.getFaculties();

    return Scaffold(
      appBar: AppBar(
        title: const Text('KKU Faculties 663040114-3'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: faculties.length,
        itemBuilder: (context, index) {
          final faculty = faculties[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.arrow_right),
              title: Text(
                faculty.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20, // Increased font size
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FacultyDetail(faculty: faculty),
                  ),
                );
              },
            ),
          );

        },
      ),
    );
  }
}
