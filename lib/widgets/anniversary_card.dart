import 'package:flutter/material.dart';

class AnniversaryCard extends StatelessWidget {
  const AnniversaryCard({super.key});

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
          // Header with sparkle emojis matching mockup exactly
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('✨', style: TextStyle(fontSize: 16)), // Sparkle emoji left
              SizedBox(width: 8),
              Text(
                'Anniversary',
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

          // Avatars with correct borders and overlays (male avatars wear black top hats)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnniversaryAvatar(
                'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&auto=format&fit=crop&q=80',
                hasPurpleBorder: true,
                showHat: false,
              ),
              const SizedBox(width: 12),
              _buildAnniversaryAvatar(
                'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&auto=format&fit=crop&q=80',
                hasPurpleBorder: false,
                showHat: false,
              ),
              const SizedBox(width: 12),
              _buildAnniversaryAvatar(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&auto=format&fit=crop&q=80',
                hasPurpleBorder: false,
                showHat: false,
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Total Count: Total in grey, | 3 | in white
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.grey, fontFamily: 'Inter'),
              children: [
                TextSpan(text: 'Total'),
                TextSpan(text: '       '),
                TextSpan(
                  text: '|   3   |',
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
                'Anniversary Wishing',
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

  Widget _buildAnniversaryAvatar(String imageUrl, {required bool hasPurpleBorder, required bool showHat}) {
    final avatarWidget = CircleAvatar(
      radius: 22,
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
        // Hat Overlay (bowler/top hat)
        if (showHat)
          Positioned(
            top: -10,
            left: 10,
            child: Transform.rotate(
              angle: -0.1,
              child: const Text(
                '🎩',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
      ],
    );
  }
}
