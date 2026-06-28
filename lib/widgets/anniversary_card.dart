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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with custom sparkles matching mockup exactly
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 2 gold stars left
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('✨', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 2),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text('✨', style: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              const Text(
                'Anniversary',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              // 3 gold stars right
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text('✨', style: TextStyle(fontSize: 10)),
                  ),
                  SizedBox(width: 2),
                  Text('✨', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 2),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Text('✨', style: TextStyle(fontSize: 9)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

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
                hasPurpleBorder: true,
                showHat: true,
              ),
              const SizedBox(width: 12),
              _buildAnniversaryAvatar(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&auto=format&fit=crop&q=80',
                hasPurpleBorder: true,
                showHat: true,
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Total Count: Total in grey, | 3 | in white
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Total',
                style: TextStyle(
                  color: Color(0xFFA3AED0),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 24),
              Text(
                '|',
                style: TextStyle(
                  color: Color(0xFF323B64),
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 16),
              Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 16),
              Text(
                '|',
                style: TextStyle(
                  color: Color(0xFF323B64),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Wishing Button: Solid light lavender-purple matching mockup
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.near_me_outlined, size: 14, color: Colors.white),
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

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: hasPurpleBorder ? const Color(0xFF6B4EFF) : Colors.grey.shade700,
          width: 2,
        ),
      ),
      child: avatarWidget,
    );
  }
}
