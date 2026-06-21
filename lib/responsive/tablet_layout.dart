import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/header.dart';
import '../widgets/banner_card.dart';
import '../widgets/projects_card.dart';
import '../widgets/creators_card.dart';
import '../widgets/performance_card.dart';
import '../widgets/calendar_card.dart';
import '../widgets/birthday_card.dart';
import '../widgets/anniversary_card.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E6E1),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FE),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 16,
                spreadRadius: 1,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Row(
              children: [
                // Left Sidebar (Fixed 240px)
                const Sidebar(),

                // Vertical divider
                Container(width: 1, color: Colors.grey.shade200),

                // Main Content Area
                Expanded(
                  child: Container(
                    color: const Color(0xFFF4F7FE),
                    child: Column(
                      children: [
                        // Header (no hamburger since sidebar is visible)
                        const Header(title: 'Home'),

                        // Main Scrollable Dashboard Content
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            children: [
                              // Banner Card
                              const BannerCard(),
                              const SizedBox(height: 20),

                              // Projects & Creators Grid/Row
                              const IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ProjectsCard(),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      flex: 1,
                                      child: CreatorsCard(),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Performance Card
                              const PerformanceCard(),
                              const SizedBox(height: 20),

                              // Tablet-adapted Bottom Row (Calendar and Birthdays/Anniversaries side-by-side)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Calendar on the left
                                  const Expanded(
                                    flex: 11,
                                    child: CalendarCard(),
                                  ),
                                  const SizedBox(width: 20),
                                  // Birthdays & Anniversaries on the right
                                  Expanded(
                                    flex: 9,
                                    child: Column(
                                      children: [
                                        const BirthdayCard(),
                                        const SizedBox(height: 20),
                                        const AnniversaryCard(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
    );
  }
}
