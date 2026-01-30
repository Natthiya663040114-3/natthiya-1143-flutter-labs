// screens/profile_card_rating.dart
// หน้าจอหลักสำหรับแสดงผลข้อมูลโปรไฟล์ (Single View)
// ใช้ Scaffold กำหนดสีพื้นหลังเป็นสีเหลือง (0xFFFDD835)
// จัดวางองค์ประกอบ (รูป, ข้อมูล, ดาว) ในแนวตั้งด้วย Column
// เหมาะสำหรับการแสดงผลบนมือถือในแนวตั้ง (Portrait Mode)
// โดยมีการ import widgets ย่อยจากโฟลเดอร์ components มาใช้งาน

import 'package:flutter/material.dart';
import '../components/contact_image.dart';
import '../components/contact_info.dart';
import '../components/ratings.dart';

class ProfileCardRating extends StatelessWidget {
  const ProfileCardRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDD835),
      body: Container(
        padding: const EdgeInsets.all(20),
        // color removed from here
        child: const Column(
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
        ),
      ),
    );
  }
}
