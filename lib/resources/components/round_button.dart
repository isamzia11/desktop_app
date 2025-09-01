import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String imagePath;
  const RoundButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: Image.asset('$imagePath'),
    );
  }
}
