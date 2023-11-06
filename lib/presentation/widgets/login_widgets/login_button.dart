// import '../../../data/providers/user_phone_provider.dart';
// import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // context.read<UserPhoneProvider>().getUserPhone().toString();
      },
      child: const Text('Log in'),
    );
  }
}
