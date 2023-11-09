import 'package:flutter/material.dart';

import 'login_button.dart';
import 'login_image.dart';
import 'login_legal.dart';
import 'login_otp_container.dart';
import 'login_skip_button.dart';
import 'otp_code_input.dart';
import 'otp_resend_code.dart';

class OTP extends StatelessWidget {
  final String verificationId;
  final int? resendOTP;
  const OTP({
    super.key,
    required this.verificationId,
    required this.resendOTP,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  skipButton(),
                  image(),
                  containerCodeButtonLegal(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget skipButton() {
    return const Flexible(
      child: Align(alignment: Alignment.centerRight, child: LoginSkipButton()),
    );
  }

  Widget image() => const Flexible(flex: 3, child: LoginImage());

  Widget containerCodeButtonLegal() {
    return Flexible(
      flex: 4,
      child: LoginOTPContainer(
        isLoginScreen: false,
        elements: [
          const SizedBox(height: 32),
          const OTPCodeInput(),
          OTPResendCode(resendOTP: resendOTP),
          LoginButton(isLoginScreen: false, verificationId: verificationId),
          const LoginLegal(),
        ],
      ),
    );
  }
}
