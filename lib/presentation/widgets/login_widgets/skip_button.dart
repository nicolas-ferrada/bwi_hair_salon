import 'package:flutter/material.dart';

class LoginSkipButton extends StatelessWidget {
  const LoginSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Text(
        'SKIP',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          color: Colors.red,
        ),
      ),
    );
  }
}
