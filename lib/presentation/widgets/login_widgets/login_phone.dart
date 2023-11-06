import 'package:flutter/material.dart';

import 'login_phone_widgets/login_phone_input.dart';

class LoginPhone extends StatelessWidget {
  const LoginPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoginPhoneInput(),
      ],
    );
  }
}
