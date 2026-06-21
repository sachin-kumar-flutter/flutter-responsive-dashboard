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

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF4F7FE),
      // Left Drawer for Sidebar on Mobile
      drawer: const Drawer(
        width: 250,
        child: Sidebar(isDrawer: true),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header with hamburger callback
            Header(
              title: 'Home',
              onMenuPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),

            // Scrollable Content Stacked Vertically
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: const [
                  // Banner Card
                  BannerCard(),
                  SizedBox(height: 16),

                  // All Projects List
                  ProjectsCard(),
                  SizedBox(height: 16),

                  // Top Creators
                  CreatorsCard(),
                  SizedBox(height: 16),

                  // Overall Performance
                  PerformanceCard(),
                  SizedBox(height: 16),

                  // Calendar
                  CalendarCard(),
                  SizedBox(height: 16),

                  // Birthdays
                  BirthdayCard(),
                  SizedBox(height: 16),

                  // Anniversaries
                  AnniversaryCard(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
