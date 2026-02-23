// main_profile_card_rating_preferences.dart
// Entry point สำหรับ Problem 2: Profile Card with Persistent Star Rating
// Initialize SharedPreferencesWithCache แล้วส่งผ่าน dependency injection
// ไปยัง ProfileCardResponsive → InteractiveRatings

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/profile_card_rating_responsive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferencesWithCache with allowList for the rating key
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'user_rating'},
    ),
  );

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Rating',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: ProfileCardResponsive(prefs: prefs),
    );
  }
}
