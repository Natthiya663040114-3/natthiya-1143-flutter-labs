import 'package:flutter/material.dart';
import '../components/pet_card.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // URL รูปภาพตามกำหนด
    const String birdImg = "https://ichef.bbci.co.uk/news/976/cpsprodpb/67CF/production/_108857562_mediaitem108857561.jpg";
    const String dogImg = "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg";
    const String catImg = "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg";
    const String rabbitImg = "https://cdn.pixabay.com/photo/2019/09/19/06/09/peter-rabbit-4488325_1280.jpg";

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Pet App"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          // Row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Center(child: PetCard(name: "Bird", imageUrl: birdImg))),
              Expanded(child: Center(child: PetCard(name: "Dog", imageUrl: dogImg))),
            ],
          ),
          const SizedBox(height: 20),
          // Row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Center(child: PetCard(name: "Cat", imageUrl: catImg))),
              Expanded(child: Center(child: PetCard(name: "Rabbit", imageUrl: rabbitImg))),
            ],
          ),
        ],
      ),
    );
  }
}