import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteContainerCard());
}

class QuoteContainerCard extends StatelessWidget {
  const QuoteContainerCard({super.key});

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
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
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

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              padding: const EdgeInsets.all(20.0),

              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 7,
                                      offset: const Offset(0,3))]
              ),

              child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Natthiya",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 10),
                      const Text(
                        "Chakaew",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}