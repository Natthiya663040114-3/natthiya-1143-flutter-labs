import 'package:flutter/material.dart';
import 'models/movie_model.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  final List<Movie> movies = const [
    Movie(
      title: "The Shawshank Redemption",
      year: 1994,
      genre: "Drama",
      director: "Frank Darabont",
      rating: 9.3,
    ),
    Movie(
      title: "Inception",
      year: 2010,
      genre: "Sci-Fi",
      director: "Christopher Nolan",
      rating: 1.9
    ),
    Movie(
      title: "Disaster Movie",
      year: 2008,
      genre: "Comedy",
      director: "Jason Friedberg",
      rating: 1.9,
    ),
  ];

  const MovieListScreen({super.key});

  void _showSnackBar(BuildContext context, double rating) {
    String message;
    if (rating > 8.0) {
      message = "This is a highly rated movies!";
    } else if (rating >= 6.0) {
      message = "This is a good movie";
    } else {
      message = "This movie might need improvement";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Movies List")),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final iconColor = movie.rating >= 7.0
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant;

          return ListTile(
            leading: Icon(Icons.star, color: iconColor),
            title: Text(movie.title,
                style: TextStyle(color: colorScheme.primary)),
            subtitle: Text(
              "${movie.year}  ${movie.genre} ${movie.director} }",
              style: TextStyle(color: colorScheme.secondary),
            ),
            onTap: () => _showSnackBar(context, movie.rating),
          );
        },
      ),
    );
  }
}