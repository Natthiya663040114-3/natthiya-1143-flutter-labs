import 'package:flutter/material.dart';
import 'screens/pets_gallery_screen.dart';

void main() {
  runApp(const PetsModelGallery());
}

class PetsModelGallery extends StatelessWidget {
  const PetsModelGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pet App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
            primarySwatch: Colors.deepOrange,
      ),
      home: const PetsGalleryScreen(),
    );
  }
}