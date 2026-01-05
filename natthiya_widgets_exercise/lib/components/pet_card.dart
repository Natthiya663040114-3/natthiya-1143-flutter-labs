import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const PetCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // ให้ Column กระชับเท่าเนื้อหา
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Image.network(
            imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover, // ให้รูปเต็มกรอบ 
            errorBuilder: (context, error, stackTrace) {
               return Container(width: 120, height: 120, color: Colors.grey, child: const Icon(Icons.error));
            },
          ),
        ),
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: const BoxDecoration(
            color: Colors.pinkAccent, 
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0)),
          ),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
