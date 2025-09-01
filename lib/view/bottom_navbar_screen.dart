import 'package:desktop_app/view_models/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  // List of screens for each tab
  final List<Widget> _screens = [
    // HomeScreen(),
    // SearchScreen(),
    // SavedScreen(),
    // HistoryScreen(),
    // NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      body: _screens[navbarProvider.selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, -3), // shadow goes upward
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0, // Remove default shadow
            type: BottomNavigationBarType.fixed,
            currentIndex: navbarProvider.selectedIndex,
            onTap: (index) => navbarProvider.setIndex(index),
            selectedItemColor: Color(0xFF00E5E5),
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
        ),
      ),
    );
  }
}
