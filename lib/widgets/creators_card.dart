import 'package:flutter/material.dart';

class CreatorsCard extends StatelessWidget {
  final bool isDesktop;

  const CreatorsCard({
    super.key,
    this.isDesktop = false,
  });

  Widget _buildCreatorRow({
    required String username,
    required String artworks,
    required double rating, // 0.0 to 1.0
    required String avatarUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          // Name & Avatar Column
          Expanded(
            flex: 7,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Artworks Column
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                artworks,
                style: const TextStyle(
                  color: Color(0xFFA3AED0),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Rating Column
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 70,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B3674).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: rating,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF4318FF),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> itemsList = [
      _buildCreatorRow(
        username: '@maddison_c21',
        artworks: '9821',
        rating: 0.9,
        avatarUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=80&auto=format&fit=crop&q=80',
      ),
      if (isDesktop) const Spacer() else const SizedBox(height: 12),
      _buildCreatorRow(
        username: '@karl.will02',
        artworks: '7032',
        rating: 0.7,
        avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=80&auto=format&fit=crop&q=80',
      ),
      if (isDesktop) const Spacer() else const SizedBox(height: 12),
      _buildCreatorRow(
        username: '@maddison_c21',
        artworks: '9821',
        rating: 0.9,
        avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=80&auto=format&fit=crop&q=80',
      ),
      if (isDesktop) const Spacer() else const SizedBox(height: 12),
      _buildCreatorRow(
        username: '@maddison_c21',
        artworks: '9821',
        rating: 0.9,
        avatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=80&auto=format&fit=crop&q=80',
      ),
    ];

    Widget itemsWidget = isDesktop
        ? Expanded(
            child: Column(
              children: itemsList,
            ),
          )
        : Column(
            children: itemsList,
          );

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111C44),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: isDesktop ? MainAxisSize.max : MainAxisSize.min,
        children: [
          const Text(
            'Top Creators',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Table Headers (aligned perfectly with columns)
          const Row(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    SizedBox(width: 40), // Alignment spacing (avatar 32 + 8 gap = 40)
                    Text(
                      'Name',
                      style: TextStyle(color: Color(0xFF8F9BBA), fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Artworks',
                    style: TextStyle(color: Color(0xFF8F9BBA), fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Rating',
                    style: TextStyle(color: Color(0xFF8F9BBA), fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          itemsWidget,
        ],
      ),
    );
  }
}
