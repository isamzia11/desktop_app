import 'package:desktop_app/navigation/routes/routes_name.dart';
import 'package:desktop_app/view/favourites_screen.dart';
import 'package:desktop_app/view/home_screen.dart';
import 'package:desktop_app/view/login_screen.dart';
import 'package:desktop_app/view/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:desktop_app/view/bottom_navbar_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );

      case RoutesName.bottom_nav_bar_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => BottomNavbarScreen(),
        );

      case RoutesName.home_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );

      case RoutesName.favourites_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => FavouritesScreen(),
        );

      case RoutesName.more_screen:
        return MaterialPageRoute(
          builder: (BuildContext context) => MoreScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('No Routes defined')));
          },
        );
    }
  }
}
