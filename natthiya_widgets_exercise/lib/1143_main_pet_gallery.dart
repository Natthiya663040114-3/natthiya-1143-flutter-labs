import 'package:flutter/material.dart';
import 'screens/pets_screen.dart'; 

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Gallery',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: const PetsScreen(),
    ),
  );
}