import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/user_phone_provider.dart';
import '../../domain/phone_service.dart';
import '../utils/color_palette.dart';

class LoginButton extends StatelessWidget {
  final bool isLoginScreen;
  final String? verificationId;
  const LoginButton({
    super.key,
    required this.isLoginScreen,
    this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(280, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorPalette.darkBlue(),
      ),
      onPressed: () => isLoginScreen
          ? loginWithPhoneNumber(context)
          : confirmOTPCode(context),
      child: const Text(
        'CONTINUE',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void loginWithPhoneNumber(BuildContext context) {
    try {
      PhoneService.signInWithPhone(
        context: context,
        phoneNumber: context.read<UserPhoneProvider>().getUserPhone(),
      );
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    }
  }

  void confirmOTPCode(BuildContext context) {
    PhoneService.verifyOTP(
      context: context,
      verificationId: verificationId!,
      userOTP: context.read<UserPhoneProvider>().getUserOTP(),
    );
  }
}
