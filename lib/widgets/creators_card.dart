import 'package:flutter/material.dart';

class CreatorsCard extends StatelessWidget {
  const CreatorsCard({super.key});

  Widget _buildCreatorRow({
    required String username,
    required String artworks,
    required double rating, // 0.0 to 1.0
    required String avatarUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Restored vertical padding
      child: Row(
        children: [
          // Name & Avatar Column
          Expanded(
            flex: 5,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16, // Restored original avatar size
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(width: 12), // Restored spacing
                Expanded(
                  child: Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13, // Restored text size
                      fontWeight: FontWeight.w600,
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
                  color: Colors.grey,
                  fontSize: 13, // Restored text size
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
                width: 70, // Restored progress bar width
                height: 8, // Restored progress bar height
                decoration: BoxDecoration(
                  color: const Color(0xFF1B2346),
                  borderRadius: BorderRadius.circular(4), // Restored radius
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: rating,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF4318FF),
                      borderRadius: BorderRadius.circular(4), // Restored radius
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111C44),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20), // Restored container padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Creators',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18, // Restored title font size
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18), // Restored title spacing

          // Table Headers (aligned perfectly with columns)
          const Row(
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    SizedBox(width: 44), // Alignment spacing (avatar 32 + 12 gap = 44)
                    Text(
                      'Name',
                      style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Artworks',
                    style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Rating',
                    style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12), // Restored spacing

          // Creator Items
          _buildCreatorRow(
            username: '@maddison_c21',
            artworks: '9821',
            rating: 0.9,
            avatarUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=80&auto=format&fit=crop&q=80',
          ),
          _buildCreatorRow(
            username: '@karl.will02',
            artworks: '7032',
            rating: 0.7,
            avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=80&auto=format&fit=crop&q=80',
          ),
          _buildCreatorRow(
            username: '@maddison_c21',
            artworks: '9821',
            rating: 0.9,
            avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=80&auto=format&fit=crop&q=80',
          ),
          _buildCreatorRow(
            username: '@maddison_c21',
            artworks: '9821',
            rating: 0.9,
            avatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=80&auto=format&fit=crop&q=80',
          ),
        ],
      ),
    );
  }
}
