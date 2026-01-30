// 1. Article Model (lib/models/article_model.dart)
// Requirements:
// Create an Article class with the following properties:
// title (String) - The article headline
// description (String) - Brief summary of the article
// date (String) - Publication date in format 'YYYY-MM-DD'
// readingTimeMinutes (int) - Estimated reading time

class Article {
  final String title;
  final String description;
  final String date;
  final int readingTimeMinutes;

  const Article({
    required this.title,
    required this.description,
    required this.date,
    required this.readingTimeMinutes,
  });
}
