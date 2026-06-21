import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive/responsive_layout.dart';
import 'responsive/mobile_layout.dart';
import 'responsive/tablet_layout.dart';
import 'responsive/desktop_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adstacks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4318FF),
          brightness: Brightness.light,
        ),
      ),
      home: const ResponsiveLayout(
        mobileLayout: MobileLayout(),
        tabletLayout: TabletLayout(),
        desktopLayout: DesktopLayout(),
      ),
    );
  }
}
