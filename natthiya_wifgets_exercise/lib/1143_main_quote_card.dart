// Inside your Flutter project <your-name>_widgets_exercises, create file main_quote_card.dart
// Create a StatelessWidget class named QuoteCard
// Display an image of your favorite quote (loaded from assets/images folder)
// Add the image to assets/images/ and update pubspec.yaml accordingly
// The image should have a maximum height of 500 pixels while maintaining aspect ratio
// Display the author's first name and last name as separate Text widgets
// Use Expanded widget to make the image and name take the full space vertically
// Arrange First name on the LEFT, last name on the RIGHT 
// Add spacing between First name and last name using SizedBox
// Text color must be your favorite color (NOT black)
// Add space around the entire content
// Remove the Debug banner


import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteCard());
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorite Quote'),
          backgroundColor: Colors.deepPurple, 
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            children: [

              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 500),
                    child: Image.asset(
                      'assets/new.jpg', 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 20), //Space

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Natthiya",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(width: 10),
                    const Text(
                      "Chakaew",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}