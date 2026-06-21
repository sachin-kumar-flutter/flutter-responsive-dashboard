import 'package:flutter/material.dart';
import 'dart:math' as math;

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220, // Reverted to design height to fit all mockup elements and fix overflow
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2E1EAB), // Deep blue-purple
            Color(0xFF7F3EBF), // Medium purple
            Color(0xFFDC7BAA), // Soft pink/rose
            Color(0xFFE8A995), // Soft peach/beige
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Custom drawn high-fidelity 3D shapes matching the original mockup
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 320,
              child: CustomPaint(
                painter: FloatingShapesPainter(),
              ),
            ),

            // Text Content on the Left
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Reduced vertical padding to prevent overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ETHEREUM 2.0',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6), // Adjusted spacing
                  const Text(
                    'Top Rating\nProject',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6), // Adjusted spacing
                  const Text(
                    'Trending project and high rating\nProject Created by team.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 10), // Adjusted spacing
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B1B36), // Charcoal dark blue matching original
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Learn More.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw a Floating 3D Black Torus (Doughnut) at the top center-right
    canvas.save();
    canvas.translate(180, 55);
    canvas.rotate(-math.pi / 6); // Angled torus

    final Path torusPath = Path()
      ..addOval(Rect.fromCenter(center: Offset.zero, width: 85, height: 55))
      ..addOval(Rect.fromCenter(center: Offset.zero, width: 35, height: 18));
    torusPath.fillType = PathFillType.evenOdd;

    final Paint torusPaint = Paint()
      ..shader = LinearGradient(
        colors: const [
          Color(0xFF3A3D46), // Highlight/light reflection
          Color(0xFF1D1F24), // Medium dark body
          Color(0xFF0C0D0E), // Deep shadow
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCenter(center: Offset.zero, width: 85, height: 55));

    canvas.drawPath(torusPath, torusPaint);
    canvas.restore();

    // 2. Draw a Floating Angled Blue Cylinder (Capsule) in the center-left
    canvas.save();
    canvas.translate(95, 135);
    canvas.rotate(-math.pi / 4); // Angled at -45 degrees
    
    final RRect capsuleRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: 22, height: 75),
      const Radius.circular(11),
    );
    final Paint capsulePaint = Paint()
      ..shader = LinearGradient(
        colors: const [Color(0xFF76C4FF), Color(0xFF0066FF)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCenter(center: Offset.zero, width: 22, height: 75));
    canvas.drawRRect(capsuleRect, capsulePaint);
    
    // Highlight shine on the blue capsule to add a 3D glass effect
    final Paint capsuleShine = Paint()..color = Colors.white.withValues(alpha: 0.4);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(-8, -30, -5, 10),
        const Radius.circular(2),
      ),
      capsuleShine,
    );
    canvas.restore();

    // 3. Draw a Floating 3D Purple Octahedron (Diamond Gem) in the center-right
    final Offset centerVertex = const Offset(225, 125);
    final Offset topVertex = const Offset(225, 60);
    final Offset bottomVertex = const Offset(225, 190);
    final Offset leftVertex = const Offset(170, 125);
    final Offset rightVertex = const Offset(280, 125);

    // Face paints
    final Paint faceTopLeft = Paint()..color = const Color(0xFF9E3CFF);
    final Paint faceTopRight = Paint()..color = const Color(0xFF781ECD);
    final Paint faceBottomLeft = Paint()..color = const Color(0xFFB566FF);
    final Paint faceBottomRight = Paint()..color = const Color(0xFF56009E);

    // Top-Left Face
    final Path pathTL = Path()
      ..moveTo(centerVertex.dx, centerVertex.dy)
      ..lineTo(leftVertex.dx, leftVertex.dy)
      ..lineTo(topVertex.dx, topVertex.dy)
      ..close();
    canvas.drawPath(pathTL, faceTopLeft);

    // Top-Right Face
    final Path pathTR = Path()
      ..moveTo(centerVertex.dx, centerVertex.dy)
      ..lineTo(rightVertex.dx, rightVertex.dy)
      ..lineTo(topVertex.dx, topVertex.dy)
      ..close();
    canvas.drawPath(pathTR, faceTopRight);

    // Bottom-Left Face
    final Path pathBL = Path()
      ..moveTo(centerVertex.dx, centerVertex.dy)
      ..lineTo(leftVertex.dx, leftVertex.dy)
      ..lineTo(bottomVertex.dx, bottomVertex.dy)
      ..close();
    canvas.drawPath(pathBL, faceBottomLeft);

    // Bottom-Right Face
    final Path pathBR = Path()
      ..moveTo(centerVertex.dx, centerVertex.dy)
      ..lineTo(rightVertex.dx, rightVertex.dy)
      ..lineTo(bottomVertex.dx, bottomVertex.dy)
      ..close();
    canvas.drawPath(pathBR, faceBottomRight);

    // 4. Draw a Floating White/Grey Rounded Cube at the bottom-right
    canvas.save();
    canvas.translate(290, 190);
    canvas.rotate(math.pi / 6); // Slightly rotated
    final RRect cubeRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: 50, height: 50),
      const Radius.circular(15),
    );
    final Paint cubePaint = Paint()
      ..shader = LinearGradient(
        colors: const [Color(0xFFFAFAFA), Color(0xFFD4D4D8)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCenter(center: Offset.zero, width: 50, height: 50));
    canvas.drawRRect(cubeRect, cubePaint);
    canvas.restore();

    // 5. Draw a Floating Teal/Cyan Dome at the bottom center-right
    canvas.save();
    canvas.translate(180, 220);
    final RRect domeRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: 60, height: 40),
      const Radius.circular(20),
    );
    final Paint domePaint = Paint()
      ..shader = LinearGradient(
        colors: const [Color(0xFF00E5FF), Color(0xFF00B0FF)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCenter(center: Offset.zero, width: 60, height: 40));
    canvas.drawRRect(domeRect, domePaint);
    canvas.restore();

    // 6. Draw a Floating Rainbow/Iridescent Bar at the top-right
    canvas.save();
    canvas.translate(265, 40);
    canvas.rotate(-math.pi / 12);
    final RRect barRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: 55, height: 16),
      const Radius.circular(8),
    );
    final Paint barPaint = Paint()
      ..shader = LinearGradient(
        colors: const [Color(0xFFFF007A), Color(0xFF9E00FF), Color(0xFF00F0FF), Color(0xFF00FF66)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromCenter(center: Offset.zero, width: 55, height: 16));
    canvas.drawRRect(barRect, barPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
