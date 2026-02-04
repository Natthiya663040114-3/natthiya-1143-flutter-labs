import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../utils/responsive.dart';

// 3. News Feed Screen (lib/screens/news_feed_screen.dart)
class NewsFeedScreen extends StatelessWidget {
  final List<Article> articles;

  const NewsFeedScreen({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
        centerTitle: true,
      ),
      // Use SafeArea to handle notches and camera cutouts
      body: SafeArea(
        // Use LayoutBuilder to get available width for responsive decisions
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final columnCount = Responsive.getColumnCount(width);

            // Conditional rendering based on screen size
            if (Responsive.isMobile(width)) {
              return _buildListView(context);
            } else {
              // Calculate aspect ratio to fit 2 rows perfectly
              // Total Height available - Padding (16top + 16bottom) - Spacing (16)
              // We want 2 rows, so each row height is (AvailableHeight - 48) / 2
              double gridHeight = constraints.maxHeight;
              double cardHeight = (gridHeight - 48) / 2;
              
              // Card Width is (AvailableWidth - Padding(16+16) - Spacing(16)) / 2 for 2 columns
              double cardWidth = (width - 48) / 2;
              
              // Calculate ratio (ensure height is positive to avoid crash)
              double aspectRatio = (cardHeight > 0) ? cardWidth / cardHeight : 1.5;
              
              return _buildGridView(context, columnCount, aspectRatio);
            }
          },
        ),
      ),
    );
  }

  // Mobile Layout: Single-column list
  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return _buildArticleCard(context, articles[index]);
      },
    );
  }

  // Tablet/Desktop Layout: Multi-column grid
  Widget _buildGridView(BuildContext context, int columnCount, double aspectRatio) {
    return GridView.builder(
      itemCount: articles.length,
      padding: const EdgeInsets.all(16),
      // Disable scrolling to fit exactly on screen
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        return _buildArticleCard(context, articles[index]);
      },
    );
  }

  // 4. Article Card with Material Design 3 Styling
  Widget _buildArticleCard(BuildContext context, Article article) {
    return Card(
      elevation: 2, // Slight elevation for depth
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Reduced padding
        child: Column(
          // Using MainAxisSize.min to avoid unbounded height error in ListView
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title: Primary color, Title Medium style (smaller)
            Text(
              article.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            
            // Description: OnSurface color, Body Small style (smaller)
            Text(
              article.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              maxLines: 3, // Allow 3 lines now that text is smaller
              overflow: TextOverflow.ellipsis,
            ),
            
            
            const SizedBox(height: 8),
            
            // Footer Row: Date and Reading Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Date: OnSurfaceVariant, Body Small
                Text(
                  article.date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 10,
                      ),
                ),
                // Reading Time: OnSurfaceVariant, Label Small
                Text(
                  '${article.readingTimeMinutes} min read',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

