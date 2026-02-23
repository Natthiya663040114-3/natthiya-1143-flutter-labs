// components/interactive_ratings.dart
// StatefulWidget จัดการ star rating + SharedPreferences
// แสดง 5 ดาว ที่ตอบสนองต่อการแตะ พร้อมบันทึกค่าลง SharedPreferences
// ใช้ colorScheme.primary สำหรับดาวที่เลือก และ colorScheme.outlineVariant สำหรับดาวที่ยังไม่เลือก

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InteractiveRatings extends StatefulWidget {
  final SharedPreferencesWithCache prefs;

  const InteractiveRatings({super.key, required this.prefs});

  @override
  State<InteractiveRatings> createState() => _InteractiveRatingsState();
}

class _InteractiveRatingsState extends State<InteractiveRatings> {
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    // SharedPreferencesWithCache reads are synchronous after initialization
    _rating = widget.prefs.getInt('user_rating') ?? 0;
  }

  Future<void> _updateRating(int newRating) async {
    setState(() {
      _rating = newRating;
    });
    await widget.prefs.setInt('user_rating', newRating);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          'Rate this profile:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            final starNumber = index + 1;
            final isActive = starNumber <= _rating;
            return IconButton(
              iconSize: 40,
              icon: Icon(
                isActive ? Icons.star : Icons.star_border,
                color: isActive
                    ? colorScheme.primary
                    : colorScheme.outlineVariant,
              ),
              onPressed: () => _updateRating(starNumber),
            );
          }),
        ),
        const SizedBox(height: 10),
        Text(
          'Rating: $_rating / 5',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
