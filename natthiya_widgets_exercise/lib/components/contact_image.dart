// components/contact_image.dart
// Widget สำหรับแสดงรูปภาพโปรไฟล์บุคคล
// ใช้ Stack เพื่อซ้อนเลเยอร์: รูปภาพวงกลม (ClipOval) อยู่ด้านหลัง
// และชื่อบุคคลแสดงอยู่ด้านล่าง พร้อมพื้นหลังสีดำทึบ (Container color: black)
// ตัวหนังสือสีขาว (Colors.white) เพื่อให้ตัดกับพื้นหลังและอ่านง่าย
// รองรับการปรับเปลี่ยนรูปภาพและชื่อผ่านพารามิเตอร์

import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final String imagePath;
  final String name;

  const ContactImage({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: Colors.black,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
