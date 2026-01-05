import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class PetCardWithModel extends StatelessWidget {
  final PetModel pet;

  const PetCardWithModel({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image with rounded top corners
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.network(
            pet.imageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        // Name label below the image
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: pet.backgroundColor,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
          child: Center(
            child: Text(
              pet.name,
              style: TextStyle(
                color: pet.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}