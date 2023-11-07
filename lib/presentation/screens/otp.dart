import 'package:flutter/material.dart';

import '../widgets/login_button.dart';
import '../widgets/login_image.dart';
import '../widgets/login_legal.dart';
import '../widgets/login_otp_container.dart';
import '../widgets/login_skip_button.dart';
import '../widgets/otp_code_input.dart';

class OTP extends StatelessWidget {
  final String verificationId;
  const OTP({
    super.key,
    required this.verificationId,
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
          LoginButton(isLoginScreen: false, verificationId: verificationId),
          const LoginLegal(),
        ],
      ),
    );
  }
}
