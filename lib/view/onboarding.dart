import 'dart:ui';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/galaxy.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Static Glowing Arc (now white with a white shadow)
            SizedBox(
              width: 100,
              height: 100,
              child: CustomPaint(painter: StaticArcPainter()),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for the Static Arc
class StaticArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    // Paint for the main white arc
    final whiteArcPaint =
        Paint()
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8.0
          ..color = Colors.white; // Solid white color

    // Paint for the glowing shadow effect
    final glowPaint =
        Paint()
          ..color = Colors.white.withOpacity(
            0.5,
          ) // Semi-transparent white for the glow
          ..maskFilter = MaskFilter.blur(
            BlurStyle.outer,
            8.0,
          ) // Outer blur for glow effect
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth =
              10.0; // Slightly thicker for the glow to spread beyond the arc

    // To create a semi-circle, we'll draw a full arc and leave a gap.
    const double startAngle = 0.5 * 3.14159; // Starts at the bottom
    const double sweepAngle = 1.5 * 3.14159; // Sweeps 270 degrees

    // First, draw the glow layer (slightly thicker and blurred)
    canvas.drawArc(rect, startAngle, sweepAngle, false, glowPaint);
    // Then, draw the solid white arc on top
    canvas.drawArc(rect, startAngle, sweepAngle, false, whiteArcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
