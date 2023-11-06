import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/user_phone_provider.dart';

class LoginPhoneInput extends StatelessWidget {
  const LoginPhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: textFormFieldStyle(),
        onChanged: (phone) => onPhoneChangeEvent(context, phone),
      ),
    );
  }

  void onPhoneChangeEvent(BuildContext context, String phone) {
    context.read<UserPhoneProvider>().changePhone(
          newUserPhone: phone,
        );
  }

  InputDecoration textFormFieldStyle() {
    return const InputDecoration(
      suffixIcon: Icon(
        Icons.phone_in_talk_outlined,
      ),
      hintText: 'Enter Mobile Number',
      hintStyle: TextStyle(color: Colors.grey),
    );
  }
}
