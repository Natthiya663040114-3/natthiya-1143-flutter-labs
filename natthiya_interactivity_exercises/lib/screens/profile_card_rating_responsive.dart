import 'package:flutter/material.dart';
import 'package:natthiya_wifgets_exercise/components/contact_image.dart';
import 'package:natthiya_wifgets_exercise/components/contact_info.dart'; // Corrected import path based on package name
import '../components/interactive_ratings.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect orientation
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const ContactImage(
          imagePath: 'assets/images/Ann.jpg',
          name: 'Ann Thongprasom',
        ),
        const ContactInfo(
          addressName: "Ann's Place",
          addressInfo: "Bangkok, Thailand, 10250",
          phone: "(086) 906 2366",
          email: "maryann_soyao@yahoo.com",
        ),
        InteractiveRatings(
          activeColor: Theme.of(context).colorScheme.primary,
          inactiveColor: Theme.of(context).colorScheme.outlineVariant,
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ContactImage(
                imagePath: 'assets/images/Ann.jpg',
                name: 'Ann Thongprasom',
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ContactInfo(
                addressName: "Ann's Place",
                addressInfo: "Bangkok, Thailand, 10250",
                phone: "(086) 906 2366",
                email: "maryann_soyao@yahoo.com",
              ),
              const SizedBox(height: 20),
              InteractiveRatings(
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveColor: Theme.of(context).colorScheme.outlineVariant,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
