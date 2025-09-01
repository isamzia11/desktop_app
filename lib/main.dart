import 'package:desktop_app/navigation/routes/routes.dart';
import 'package:desktop_app/navigation/routes/routes_name.dart';
import 'package:desktop_app/view/onboarding.dart';
import 'package:desktop_app/view_models/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavbarProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        // home: Onboarding(),
        initialRoute: RoutesName.login_screen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
