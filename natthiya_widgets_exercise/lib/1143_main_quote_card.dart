/* This widget creates the Quote Card screen. I removed the debug banner 
      and used a Scaffold with a deep purple AppBar. The body uses a Column 
      wrapped in Padding to organize the layout. I used Expanded widgets to 
      allocate space for both the image (constrained to 500px height) and 
      the name section. The name is displayed in a Row to separate the first 
      and last name, styled with a purple color.
*/


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