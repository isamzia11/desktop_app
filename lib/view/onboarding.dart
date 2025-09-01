import 'dart:async';
import 'dart:ui';
import 'package:desktop_app/view/login_screen.dart';
import 'package:flutter/material.dart';

// First, create the Onboarding screen as a StatefulWidget
// so it can manage its own state (the timer).
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    // Start a timer that navigates after 5 seconds
    Timer(const Duration(seconds: 5), () {
      // Use Navigator.of(context) to push a new page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:
              (context) =>
                  const LoginScreen(), // The login page you want to go to
        ),
      );
    });
  }

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
            SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: StaticArcPainter(),
                child: Center(
                  child: SizedBox(
                    width: 150, // Updated width and height to match the image
                    height: 150,
                    child: Image.asset(
                      'assets/logo (1).png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
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

    final whiteArcPaint =
        Paint()
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8.0
          ..color = Colors.white;

    final glowPaint =
        Paint()
          ..color = Colors.white.withOpacity(0.5)
          ..maskFilter = MaskFilter.blur(BlurStyle.outer, 8.0)
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10.0;

    const double startAngle = -0.5 * 3.14159;
    const double sweepAngle = 1.5 * 3.14159;

    canvas.drawArc(rect, startAngle, sweepAngle, false, glowPaint);
    canvas.drawArc(rect, startAngle, sweepAngle, false, whiteArcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
