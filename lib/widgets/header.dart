import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;

  const Header({
    super.key,
    required this.title,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool showMenuButton = onMenuPressed != null;
    final bool isDesktop = MediaQuery.of(context).size.width >= 1200;

    if (isDesktop) {
      return Row(
        children: [
          // Middle Content Header (Flexible width, aligns with main cards column)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title Area
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF707EAE), // Grey-slate title color matching mockup
                    ),
                  ),

                  // Search Bar (aligned to the right of the middle column, just above the banner)
                  Container(
                    width: 280, // Long search tab as shown in the pic
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B2346), // Deep navy/slate background
                      borderRadius: BorderRadius.circular(21),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Color(0xFF8F9BBA), fontSize: 13),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0xFF8F9BBA),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Pane Header (Fixed 350px width aligned with RightPane card below)
          Container(
            width: 350,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Push icons to left, avatar to right
              children: [
                // Small icons group on the left side of the right panel header area
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Folder Icon with badge matching mockup
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.insert_drive_file_outlined, color: Color(0xFF2B3674), size: 28),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2B3674), // Outline blue badge dot
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),

                    // Notification Icon with badge
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_none_outlined, color: Color(0xFF2B3674), size: 28),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFB547), // Gold/orange badge
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),

                    // Power Icon
                    IconButton(
                      icon: const Icon(Icons.power_settings_new_rounded, color: Color(0xFF2B3674), size: 28),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),

                // Avatar on the far right of the right panel header area
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // Mobile/Tablet Layout (Normal unified layout)
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title area
          Row(
            children: [
              if (showMenuButton) ...[
                IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFF2B3674)),
                  onPressed: onMenuPressed,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF707EAE), // Grey-slate title color matching mockup
                ),
              ),
            ],
          ),

          // Action Items & Search Bar
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Search Bar (collapses or shrinks on small screens)
                Flexible(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 260),
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B2346), // Deep navy/slate background
                      borderRadius: BorderRadius.circular(21),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Color(0xFF8F9BBA), fontSize: 13),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Color(0xFF8F9BBA),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Folder Icon with badge
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.insert_drive_file_outlined, color: Color(0xFF2B3674), size: 20),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2B3674),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),

                // Notification Icon with badge
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_none_outlined, color: Color(0xFF2B3674), size: 28),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFB547), // Gold/orange badge
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),

                // Power Icon
                IconButton(
                  icon: const Icon(Icons.power_settings_new_rounded, color: Color(0xFF2B3674), size: 20),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 12),

                // Small user avatar (local generated memoji)
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
