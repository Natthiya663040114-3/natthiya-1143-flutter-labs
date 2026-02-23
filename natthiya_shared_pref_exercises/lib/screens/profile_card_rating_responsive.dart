// screens/profile_card_rating_responsive.dart
// ProfileCardResponsive widget — รองรับทั้ง portrait และ landscape
// ใช้ OrientationBuilder เพื่อเปลี่ยน layout ตามทิศทางหน้าจอ
// Portrait: เรียงแนวตั้ง (รูป → ข้อมูล → ดาว)
// Landscape: เรียงแนวนอน (รูปซ้าย | ข้อมูล+ดาวขวา)
// Reuse ContactImage จาก natthiya_wifgets_exercise

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:natthiya_wifgets_exercise/components/contact_image.dart';
import '../components/interactive_ratings.dart';

class ProfileCardResponsive extends StatelessWidget {
  final SharedPreferencesWithCache prefs;

  const ProfileCardResponsive({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Rating'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: orientation == Orientation.portrait
                  ? _buildPortraitLayout(context)
                  : _buildLandscapeLayout(context),
            ),
          );
        },
      ),
    );
  }

  // Portrait Layout: เรียงแนวตั้ง
  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileCard(context),
        const SizedBox(height: 20),
        InteractiveRatings(prefs: prefs),
      ],
    );
  }

  // Landscape Layout: เรียงแนวนอน (ซ้าย: รูป, ขวา: ข้อมูล + ดาว)
  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileImage(),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildProfileDetails(context),
              const SizedBox(height: 20),
              InteractiveRatings(prefs: prefs),
            ],
          ),
        ),
      ],
    );
  }

  // Profile Card สำหรับ Portrait mode
  Widget _buildProfileCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildProfileImage(),
            const SizedBox(height: 16),
            _buildProfileDetails(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return const ContactImage(
      imagePath: 'packages/natthiya_wifgets_exercise/assets/images/Ann.jpg',
      name: 'แอน ทองประสม',
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Column(
      children: [
        Text(
          'Natthiya C.',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}
