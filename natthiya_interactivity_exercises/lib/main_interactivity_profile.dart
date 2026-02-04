import 'package:flutter/material.dart';
import 'screens/profile_card_rating_responsive.dart';

void main() {
  runApp(const MainInteractivityProfile());
}

class MainInteractivityProfile extends StatelessWidget {
  const MainInteractivityProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interactive Profile Card',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple, // Example seed color
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system, // Support both light and dark modes
      home: const ProfileCardRatingResponsive(),
    );
  }
}
