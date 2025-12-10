import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteCardEx3());
}

class QuoteCardEx3 extends StatelessWidget {
  const QuoteCardEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorite Quote'),
          backgroundColor: Colors.blue, // Theme color
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            // Top Section: Image
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 500),
                  child: Image.asset(
                    'assets/images/quote.jpg', 
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text('Please add an image to assets/images/quote.jpg'),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Bottom Section: Author Name inside a Container
            // Instructions:
            // 1. Use a container to set padding and margin
            // 2. Equal white spaces on the left and right (achieved via symmetric horizontal margin)
            // 3. Space between text and border (achieved via padding)
            // 4. Decoration with favorite color and border
            Container(
              // Margin: Creates space OUTSIDE the border.
              // symmetric(horizontal: 50) creates equal whitespace on left and right.
              margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              
              // Padding: Creates space INSIDE the border (between border and text).
              padding: const EdgeInsets.all(20.0),
              
              // Decoration: Handles background color and border
              decoration: BoxDecoration(
                color: Colors.pinkAccent, // My favorite color (from example)
                border: Border.all(
                  color: Colors.black, // Adding a border
                  width: 3.0,
                ),
                // Optional: Rounded corners often look better with borders
                // borderRadius: BorderRadius.circular(10), 
              ),
              
              // The Child (Text)
              child: const Text(
                "Eliud Kipchoge",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color contrasting with pink background
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}