import 'package:flutter/material.dart';

class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2B253B), // Matches the exact dark grey-purple card background
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with custom drawn sparkles/stars matching mockup exactly
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('✨', style: TextStyle(fontSize: 16)), // Sparkle emoji left
              SizedBox(width: 8),
              Text(
                'Today Birthday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Text('✨', style: TextStyle(fontSize: 16)), // Sparkle emoji right
            ],
          ),
          const SizedBox(height: 16),

          // Avatars with correct borders and overlays
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBirthdayAvatar(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&auto=format&fit=crop&q=80',
                hasPurpleBorder: true,
                showHat: false,
              ),
              const SizedBox(width: 16),
              _buildBirthdayAvatar(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&auto=format&fit=crop&q=80',
                hasPurpleBorder: false,
                showHat: false,
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Total Count: Total in grey, | 2 | in white
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Inter'),
              children: [
                TextSpan(text: 'Total'),
                TextSpan(text: '       '),
                TextSpan(
                  text: '|   2   |',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Wishing Button: Solid light lavender-purple matching mockup
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send_rounded, size: 14, color: Colors.white),
              label: const Text(
                'Birthday Wishing',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB58DF2), // Light lavender-purple
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBirthdayAvatar(String imageUrl, {required bool hasPurpleBorder, required bool showHat}) {
    final avatarWidget = CircleAvatar(
      radius: 24,
      backgroundImage: NetworkImage(imageUrl),
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Person Avatar with border container
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: hasPurpleBorder ? const Color(0xFF6B4EFF) : Colors.grey.shade700,
              width: 2,
            ),
          ),
          child: avatarWidget,
        ),
        // Hat overlay for male avatar
        if (showHat)
          Positioned(
            top: -12,
            left: 8,
            child: Transform.rotate(
              angle: -0.1,
              child: const Text(
                '🎩',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        // Birthday Cake floating on top-right for both
        Positioned(
          top: -12,
          right: -8,
          child: Transform.rotate(
            angle: 0.15,
            child: const Text(
              '🎂',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}


