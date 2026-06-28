import 'package:flutter/material.dart';
import 'calendar_card.dart';
import 'birthday_card.dart';
import 'anniversary_card.dart';

class RightPane extends StatelessWidget {
  const RightPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(top: 16, right: 24, bottom: 16), // Align top with banner, right with header, bottom with performance card
      decoration: BoxDecoration(
        color: const Color(0xFF0B1437), // Dark navy background matching mockup
        borderRadius: BorderRadius.circular(20), // Rounded corners matching other dashboard cards
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Title
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'GENERAL 10:00 AM TO 7:00 PM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),

          // Stacked panels (fits fully on the screen without scrolling in Desktop)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                CalendarCard(),
                Spacer(),
                BirthdayCard(),
                Spacer(),
                AnniversaryCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
