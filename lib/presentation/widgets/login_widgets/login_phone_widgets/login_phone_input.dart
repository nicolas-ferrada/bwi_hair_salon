import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/providers/user_phone_provider.dart';

class LoginPhoneInput extends StatefulWidget {
  const LoginPhoneInput({super.key});

  @override
  State<LoginPhoneInput> createState() => _LoginPhoneInputState();
}

class _LoginPhoneInputState extends State<LoginPhoneInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        onChanged: (phone) {
          context.read<UserPhoneProvider>().changePhone(
                newUserPhone: int.parse(phone),
              );
        },
      ),
    );
  }
}
