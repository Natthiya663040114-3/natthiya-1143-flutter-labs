import 'package:flutter/material.dart';
import '../models/pet_model.dart';
import '../components/pet_card_with_model.dart';

/// This screen displays a gallery of pets organized in a grid layout using a nested Column and Row structure.
/// It utilizes the PetCardWithModel widget to render individual pet cards, verifying the reuse of components with different data models.
/// The layout consists of two rows, each containing two pet cards wrapped in Expanded widgets to ensure equal width distribution across the screen.
/// We use MainAxisAlignment.spaceEvenly to space the rows and cards appropriately, providing a balanced visual appearance.
/// A SizedBox of height 16 is placed between the rows to adhere to the design specifications for vertical spacing.
/// The entire grid is centered within a Scaffold, which features a custom background color and an AppBar titled "Pet Gallery".
class PetsGalleryScreen extends StatelessWidget {
  const PetsGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const birdUrl = "https://ichef.bbci.co.uk/news/976/cpsprodpb/67CF/production/_108857562_mediaitem108857561.jpg";
    const dogUrl = "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg";
    const catUrl = "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg";
    const rabbitUrl = "https://cdn.pixabay.com/photo/2019/09/19/06/09/peter-rabbit-4488325_1280.jpg";

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F6), 
      appBar: AppBar(
        title: const Text("My Pet App"), 
        backgroundColor: Colors.deepOrange,
        centerTitle: false,
      ),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
                Expanded(child: Center(child: PetCardWithModel(pet: PetModel(name: "Bird", imageUrl: birdUrl)))), 
                Expanded(child: Center(child: PetCardWithModel(pet: PetModel(name: "Dog", imageUrl: dogUrl, backgroundColor: const Color(0xFF795548))))), 
              ],
            ),
            const SizedBox(height: 16), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Center(child: PetCardWithModel(pet: PetModel(name: "Cat", imageUrl: catUrl, textColor: Colors.yellow)))), 
                Expanded(child: Center(child: PetCardWithModel(pet: PetModel(name: "Rabbit", imageUrl: rabbitUrl, backgroundColor: Colors.green, textColor: Colors.yellow)))), 
              ],
            ),
          ],
        ),
      ),
    );
  }
}