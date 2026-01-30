import 'package:flutter/material.dart';
import 'models/article_model.dart';
import 'screens/news_feed_screen.dart';

// 5. Main Application (lib/main_news_feed_responsive.dart)
// Requirements:
// Configure MaterialApp with Material Design 3 theme
// Use useMaterial3: true in ThemeData
// Define a ColorScheme using ColorScheme.fromSeed()

void main() {
  runApp(const NewsFeedResponsiveApp());
}

class NewsFeedResponsiveApp extends StatelessWidget {
  const NewsFeedResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive News Feed',
      // Configure MD3 Theme
      theme: ThemeData(
        useMaterial3: true,
        // Generate a complete color scheme from a single seed color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      // 6. Sample Articles Data
      home: const NewsFeedScreen(
        articles: [
          Article(
            title: 'Introduction to Flutter',
            description: 'Learn the basics of Flutter development and widgets.',
            date: '2024-01-05',
            readingTimeMinutes: 5,
          ),
          Article(
            title: 'Advanced Widget Patterns',
            description: 'Discover advanced patterns in Flutter for building complex UIs.',
            date: '2024-01-04',
            readingTimeMinutes: 8,
          ),
          Article(
            title: 'State Management in Flutter',
            description: 'Explore different state management approaches like Provider and Riverpod.',
            date: '2024-01-03',
            readingTimeMinutes: 12,
          ),
          Article(
            title: 'Building Responsive UIs',
            description: 'Create apps that work on any screen size using MediaQuery and LayoutBuilder.',
            date: '2024-01-02',
            readingTimeMinutes: 10,
          ),

        ],
      ),
    );
  }
}
