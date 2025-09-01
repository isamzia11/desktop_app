import 'dart:ui'; // Import this for ImageFilter
import 'package:desktop_app/resources/components/round_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // This is crucial for the blur effect
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          kToolbarHeight + 20,
        ), // Adjust height as needed
        child: Stack(
          children: [
            // BackdropFilter for the blurred background
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // The actual AppBar content
            AppBar(
              leading: Container(
                margin: EdgeInsets.only(top: 15),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Icon(Icons.menu, color: Colors.white),
              ),
              backgroundColor: Colors.transparent, // Make this transparent
              elevation: 0, // Remove default shadow
              title: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Milky Way',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      'Solar System',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/galaxy.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: const Column(
          children: [
            // Your body content goes here
          ],
        ),
      ),
    );
  }
}
