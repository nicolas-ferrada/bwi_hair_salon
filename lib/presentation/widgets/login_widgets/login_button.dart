import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/user_phone_provider.dart';
import '../../../domain/phone_service.dart';
import '../../utils/color_palette.dart';
import '../../utils/show_snackbar.dart';

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

  void loginWithPhoneNumber(BuildContext context) async {
    try {
      await SignInWithPhoneService.verifyPhoneNumber(
        context: context,
        phoneNumber: context.read<UserPhoneProvider>().getUserPhone(),
      );
    } catch (error) {
      // ignore: use_build_context_synchronously
      ShowSnackbar().show(context: context, message: error.toString());
    }
  }

  void confirmOTPCode(BuildContext context) async {
    try {
      await SignInWithPhoneService.verifyOTP(
        context: context,
        verificationId: verificationId!,
        userOTP: context.read<UserPhoneProvider>().getUserOTP(),
      ).then((value) => Navigator.maybePop(context));
    } catch (error) {
      // ignore: use_build_context_synchronously
      ShowSnackbar().show(
        context: context,
        message: error.toString(),
      );
    }
  }
}
