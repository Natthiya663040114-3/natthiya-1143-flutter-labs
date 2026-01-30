// lib/main_profile_card_rating_responsive.dart
// ไฟล์หลักสำหรับ Lab 6: Responsive Layouts
// ทำหน้าที่ตรวจสอบทิศทางหน้าจอด้วย MediaQuery.of(context).orientation
// หากเป็นแนวตั้ง (Portrait) จะแสดงผลแบบ Column (เรียงลงมา)
// หากเป็นแนวนอน (Landscape) จะแสดงผลแบบ Row (แบ่งซ้ายขวา)
// โดยกำหนดสีพื้นหลังของ Scaffold เป็นสีเหลืองให้เต็มหน้าจอ

import 'package:flutter/material.dart';
import 'components/contact_image.dart';
import 'components/contact_info.dart';
import 'components/ratings.dart';

void main() {
  runApp(const ProfileCardResponsiveApp());
}

class ProfileCardResponsiveApp extends StatelessWidget {
  const ProfileCardResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Profile Card',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.light,
        ).copyWith(surface: Colors.white),
      ),
      home: const ProfileCardResponsiveScreen(),
    );
  }
}

class ProfileCardResponsiveScreen extends StatelessWidget {
  const ProfileCardResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Orientation Detection: ตรวจสอบทิศทางหน้าจอ
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.cyanAccent, // Changed to cyanAccent as per requirements
      // 1. & 5. SafeArea Usage & Container background
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          // color removed from here to allow Scaffold color to show
          padding: const EdgeInsets.all(20),
          child: orientation == Orientation.portrait
              ? _buildPortraitLayout()
              : _buildLandscapeLayout(),
        ),
      ),
    );
  }

  // 3. Portrait Layout: เรียงแนวตั้งเหมือน Lab 5
  Widget _buildPortraitLayout() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ContactImage(
          imagePath: 'assets/images/Ann.jpg',
          name: 'แอน ทองประสม',
        ),
        ContactInfo(
          addressName: "Ann's Place",
          addressInfo: "Bangkok, Thailand, 10250",
          phone: "(086) 906 2366",
          email: "maryann_soyao@yahoo.com",
        ),
        Ratings(
          ratingColor: Colors.green,
          defaultColor: Colors.black,
        ),
      ],
    );
  }

  // 4. Landscape Layout: เรียงแนวนอน (ซ้าย: รูป, ขวา: ข้อมูล)
  Widget _buildLandscapeLayout() {
    return const Row(
      children: [
        // Left Column: ContactImage
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactImage(
                imagePath: 'assets/images/Ann.jpg',
                name: 'แอน ทองประสม',
              ),
            ],
          ),
        ),
        SizedBox(width: 20), // Spacing between columns
        // Right Column: ContactInfo and Ratings
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactInfo(
                addressName: "Ann's Place",
                addressInfo: "Bangkok, Thailand, 10250",
                phone: "(086) 906 2366",
                email: "maryann_soyao@yahoo.com",
              ),
              SizedBox(height: 20),
              Ratings(
                ratingColor: Colors.green,
                defaultColor: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
