import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hair Salon',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
