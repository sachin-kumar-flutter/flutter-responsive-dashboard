import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/header.dart';
import '../widgets/banner_card.dart';
import '../widgets/projects_card.dart';
import '../widgets/creators_card.dart';
import '../widgets/performance_card.dart';
import '../widgets/right_pane.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E6E1), // Light grey outer canvas matching mockup border
      body: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Container(
            width: 1440,
            height: 1080, // Adjusted height to accommodate spacious design sizes without internal overflow
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7FE), // Main dashboard background
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Row(
                children: [
                  // Left Sidebar (Fixed 250px)
                  const Sidebar(),

                  // Vertical divider
                  Container(width: 1, color: Colors.grey.shade200),

                  // Main Dashboard Content + Header Area (Flexible)
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF4F7FE),
                      child: Column(
                        children: [
                          // Header (spans across both middle column and right pane)
                          const Header(title: 'Home'),

                          // Content Row below Header
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Middle Column Cards Area
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: const [
                                        // Banner Card
                                        BannerCard(),
                                        SizedBox(height: 24),

                                        // Row of All Projects & Top Creators
                                        IntrinsicHeight(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: ProjectsCard(),
                                              ),
                                              SizedBox(width: 24),
                                              Expanded(
                                                flex: 4,
                                                child: CreatorsCard(isDesktop: true),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 24),

                                        // Over All Performance Card
                                        PerformanceCard(isExpanded: false),
                                      ],
                                    ),
                                  ),
                                ),

                                // Right Pane (starts below header, aligned with banner card)
                                const RightPane(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
