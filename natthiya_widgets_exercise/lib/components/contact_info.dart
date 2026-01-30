// components/contact_info.dart
// Widget แสดงรายละเอียดข้อมูลการติดต่อ (ที่อยู่, โทรศัพท์, อีเมล)
// ตกแต่งด้วย Container สีขาว มุมโค้ง (BorderRadius) เหมือนการ์ด
// รองรับ Theme Mode: สีพื้นหลังจะเปลี่ยนตาม Theme (ขาว/เทาเข้ม)
// ภายในใช้ Row เพื่อจัดไอคอนคู่กับข้อความ และใช้ Expanded จัดการข้อความยาวๆ

import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final String addressName;
  final String addressInfo;
  final String email;
  final String phone;

  const ContactInfo({
    super.key,
    required this.addressName,
    required this.addressInfo,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Address Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.deepOrange,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addressName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      addressInfo,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.grey.withOpacity(0.2), height: 1),
          const SizedBox(height: 16),
          
          // Phone Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.phone,
                color: Colors.deepOrange,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                phone,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Email Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.email,
                color: Colors.deepOrange,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  email,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
