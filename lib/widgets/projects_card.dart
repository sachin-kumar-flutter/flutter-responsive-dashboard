import 'package:flutter/material.dart';

class ProjectsCard extends StatelessWidget {
  const ProjectsCard({super.key});

  Widget _buildProjectItem({
    required int index,
    required bool isHighlighted,
    required String title,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16), // Restored original spacing
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // Restored corner radius
        color: isHighlighted ? const Color(0xFFD53A52) : const Color(0xFF1A2251),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Restored original padding
      child: Row(
        children: [
          // Project image/thumbnail
          Container(
            width: 48,
            height: 48, // Restored size
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), // Restored radius
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Project texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14, // Restored text size
                    letterSpacing: 0.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Project #$index',
                      style: TextStyle(
                        color: isHighlighted ? Colors.white.withValues(alpha: 0.8) : const Color(0xFFA3AED0),
                        fontSize: 12, // Restored text size
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '•',
                      style: TextStyle(
                        color: isHighlighted ? Colors.white.withValues(alpha: 0.8) : const Color(0xFFA3AED0),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'See details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12, // Restored text size
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Edit icon
          Icon(
            Icons.edit,
            color: isHighlighted ? Colors.white : const Color(0xFFA3AED0),
            size: 18, // Restored icon size
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F1631),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24), // Restored original padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18, // Restored title font size
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20), // Restored title bottom spacing
          _buildProjectItem(
            index: 1,
            isHighlighted: true,
            title: 'Technology behind the Blockchain',
            imageUrl: 'https://images.unsplash.com/photo-1639762681485-074b7f938ba0?w=100&auto=format&fit=crop&q=80',
          ),
          _buildProjectItem(
            index: 1,
            isHighlighted: false,
            title: 'Technology behind the Blockchain',
            imageUrl: 'https://images.unsplash.com/photo-1639762681057-408e52192e55?w=100&auto=format&fit=crop&q=80',
          ),
          _buildProjectItem(
            index: 1,
            isHighlighted: false,
            title: 'Technology behind the Blockchain',
            imageUrl: 'https://images.unsplash.com/photo-1642104704074-907c0698cbd9?w=100&auto=format&fit=crop&q=80',
          ),
        ],
      ),
    );
  }
}
