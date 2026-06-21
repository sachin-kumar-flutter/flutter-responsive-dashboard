import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final bool isDrawer;
  const Sidebar({super.key, this.isDrawer = false});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String _activeItem = 'Home';
  bool _isAdstacksExpanded = false;
  bool _isFinanceExpanded = false;

  Widget _buildLogo() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildProfile() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.amber.shade500, // Yellow border
              width: 2.5,
            ),
          ),
          child: const CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&auto=format&fit=crop&q=80',
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Pooja Mishra',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFECE7FF), // Light purple background
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF9E00FF).withValues(alpha: 0.25),
              width: 1.2,
            ),
          ),
          child: const Text(
            'Admin',
            style: TextStyle(
              color: Color(0xFF9E00FF), // Purple text
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    IconData? activeIcon,
  }) {
    final bool isActive = _activeItem == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeItem = label;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          right: isActive ? 24 : 0,
          top: 2,
          bottom: 2,
        ),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFECEEF1) : Colors.transparent, // Soft light-grey background for Home
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Icon(
              isActive ? (activeIcon ?? icon) : icon,
              color: Colors.black, // Dark/black outlined icons
              size: isActive ? 22 : 20,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                fontSize: isActive ? 16 : 14, // Larger bold text for active Home
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkspaceTile({
    required String label,
    required bool isExpanded,
    required ValueChanged<bool> onExpansionChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ExpansionTile(
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.black,
          size: 20,
        ),
        onExpansionChanged: onExpansionChanged,
        shape: const Border(),
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(left: 16, bottom: 8),
        children: const [
          ListTile(title: Text('Overview', style: TextStyle(fontSize: 13))),
          ListTile(title: Text('Projects', style: TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Logo section
          _buildLogo(),
          const SizedBox(height: 12),
          // Grey divider
          const Divider(color: Color(0xFFE2E8F0), thickness: 1, indent: 0, endIndent: 0),
          const SizedBox(height: 12),
          
          // Profile section
          _buildProfile(),
          const SizedBox(height: 16),
          // Grey divider
          const Divider(color: Color(0xFFE2E8F0), thickness: 1, indent: 0, endIndent: 0),
          const SizedBox(height: 8),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(
                  icon: Icons.home_outlined, 
                  activeIcon: Icons.home, // Solid black home icon
                  label: 'Home',
                ),
                _buildMenuItem(icon: Icons.people_outline, label: 'Employees'),
                _buildMenuItem(icon: Icons.checklist, label: 'Attendance'),
                _buildMenuItem(icon: Icons.calendar_today_outlined, label: 'Summary'),
                _buildMenuItem(icon: Icons.info_outline, label: 'Information'),

                // Workspaces header bar spanning width
                Container(
                  width: double.infinity,
                  color: const Color(0xFFE8EEFA), // Soft blue-purple background
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  margin: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'WORKSPACES',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                // Workspace Tiles (no leading icons, clean text)
                _buildWorkspaceTile(
                  label: 'Adstacks',
                  isExpanded: _isAdstacksExpanded,
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isAdstacksExpanded = expanded;
                    });
                  },
                ),
                _buildWorkspaceTile(
                  label: 'Finance',
                  isExpanded: _isFinanceExpanded,
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isFinanceExpanded = expanded;
                    });
                  },
                ),
              ],
            ),
          ),

          // Footer Settings and Logout
          const Divider(color: Color(0xFFE2E8F0), thickness: 1, indent: 0, endIndent: 0),
          _buildMenuItem(icon: Icons.settings_outlined, label: 'Setting'),
          _buildMenuItem(icon: Icons.logout_outlined, label: 'Logout'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}


