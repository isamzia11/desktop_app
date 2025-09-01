import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/galaxy.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(children: [

          ],
        ),
      ),
    );
  }
}
