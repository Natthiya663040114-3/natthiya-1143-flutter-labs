import 'package:flutter/material.dart';
import 'components/profile_with_button.dart';

void main() {
  runApp(const ProfileButtonApp());
}

class ProfileButtonApp extends StatelessWidget {
  const ProfileButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile with Button',
      
      // Light Theme Configuration
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      
      // Dark Theme Configuration
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      
      // Main Application Structure
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Card'),
          centerTitle: true,
        ),
        body: const SafeArea(
          child: ProfileWithButton(),
        ),
      ),
    );
  }
}
