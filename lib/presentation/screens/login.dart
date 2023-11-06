import 'package:flutter/material.dart';

import '../widgets/login_widgets/login_button.dart';
import '../widgets/login_widgets/login_image.dart';
import '../widgets/login_widgets/login_legal.dart';
import '../widgets/login_widgets/login_phone.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LoginImage(),
            LoginPhone(),
            LoginButton(),
            LoginLegal(),
          ],
        ),
      ),
    );
  }
}
