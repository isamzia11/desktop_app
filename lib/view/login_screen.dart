import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          children: [
            // Expanded widget makes the Stack take up the available space
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0, // It's good practice to set all four bounds
                    right: 0,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white24.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
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
