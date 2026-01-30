// main_profile_card_rating.dart
// ไฟล์หลัก (Entry Point) สำหรับ Lab 5: Profile Card
// ทำหน้าที่กำหนดค่า MaterialApp และ Theme ของแอปพลิเคชัน
// ตั้งค่าสีพื้นฐาน (Seed Color) เป็นสีเหลืองสำหรับทั้ง Light และ Dark Theme
// และเรียกใช้งานหน้าจอหลัก ProfileCardRating เป็นหน้าแรก
//
// Created by: Natthiya (ID: 1143)

import 'package:flutter/material.dart';
import 'screens/profile_card_rating.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Card",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.light,
        ).copyWith(surface: Colors.white),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ProfileCardRating(),
    );
  }
}
