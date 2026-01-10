import 'package:flutter/material.dart';
import 'models/movie_model.dart';

void main() {
  runApp(const MovieListApp());
}

class MovieListApp extends StatelessWidget {
  const MovieListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie List',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system, // Follow system preference
      home: const MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      const Movie(
        title: "The Shawshank Redemption",
        year: 1994,
        genre: "Drama",
        director: "Frank Darabont",
        rating: 9.3,
      ),
      const Movie(
        title: "Inception",
        year: 2010,
        genre: "Sci-Fi",
        director: "Christopher Nolan",
        rating: 7.8,
      ),
      const Movie(
        title: "Disaster Movie",
        year: 2008,
        genre: "Comedy",
        director: "Jason Friedberg",
        rating: 1.9,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final colorScheme = Theme.of(context).colorScheme;

          return ListTile(
            leading: Icon(
              Icons.movie,
              color: colorScheme.primary,
              size: 48,
            ),
            title: Text(
              movie.title,
              style: TextStyle(
                fontWeight: movie.rating >= 7.0 ? FontWeight.bold : FontWeight.normal,
                color:  colorScheme.primary ,
                fontSize: 24,
              ),
            ),
            subtitle: Text(
              "${movie.year} • ${movie.genre}\nDirector: ${movie.director}",
              style: TextStyle(
                color: colorScheme.secondary,
                fontSize: 16,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: movie.rating >= 7.0 ? colorScheme.primary : colorScheme.onSurfaceVariant,
                      size: 28,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.rating.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: movie.rating >= 7.0 ? colorScheme.primary : colorScheme.onSurfaceVariant,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isThreeLine: true, // Allow subtitle to take more space
            onTap: () {
              String message;
              if (movie.rating > 8.0) {
                message = "This is a highly rated movie!";
              } else if (movie.rating >= 6.0) {
                message = "This is a good movie";
              } else {
                message = "This movie might need improvement";
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}