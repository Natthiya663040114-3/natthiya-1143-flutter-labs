import 'package:flutter/material.dart';
import '../models/faculty_model.dart';

class FacultyDetail extends StatelessWidget {
  final FacultyModel faculty;

  const FacultyDetail({super.key, required this.faculty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(faculty.name),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 30),
            // URL Link Pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF66DBC4), // Teal-like color
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                faculty.url,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Thai Name
            Text(
              faculty.thaiName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF66DBC4), // Matching Teal color
              ),
            ),
            
            const SizedBox(height: 80),
            
            // Faculty Image at the bottom
            Image.asset(
              faculty.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), 
          ],
        ),
      ),
    );
  }
}
