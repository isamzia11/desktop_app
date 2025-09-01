import 'dart:ui';
import 'package:desktop_app/view/favourites_screen.dart';
import 'package:desktop_app/view/home_screen.dart';
import 'package:desktop_app/view/more_screen.dart';
import 'package:desktop_app/view_models/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    FavouritesScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      extendBody:
          true, // This is key to allow the body to extend behind the nav bar
      body: _screens[navbarProvider.selectedIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // This container creates the blurred, rounded, transparent background
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height:
                    kBottomNavigationBarHeight +
                    20, // Give it a slight padding/height
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // This is the actual navigation bar placed on top of the blur
          BottomNavigationBar(
            backgroundColor: Colors.transparent, // Set to transparent
            elevation: 0, // Remove default shadow
            type: BottomNavigationBarType.fixed,
            currentIndex: navbarProvider.selectedIndex,
            onTap: (index) => navbarProvider.setIndex(index),
            selectedItemColor: const Color(0xFF00E5E5),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.language),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline, size: 19),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_outlined),
                label: 'More',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
