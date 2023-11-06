// import '../../../data/providers/user_phone_provider.dart';
// import 'package:provider/provider.dart';

import 'package:bwi_hair_salon/presentation/utils/color_palette.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(280, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorPalette.darkBlue(),
      ),
      onPressed: () {
        // context.read<UserPhoneProvider>().getUserPhone().toString();
      },
      child: const Text(
        'CONTINUE',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
