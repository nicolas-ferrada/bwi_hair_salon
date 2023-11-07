import 'package:flutter/material.dart';

import '../widgets/login_widgets/login_button.dart';
import '../widgets/login_widgets/login_image.dart';
import '../widgets/login_widgets/login_legal.dart';
import '../widgets/login_widgets/login_otp_container.dart';
import '../widgets/login_widgets/login_phone_input.dart';
import '../widgets/login_widgets/login_skip_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                  containerPhoneButtonLegal(),
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

  Widget containerPhoneButtonLegal() {
    return const Flexible(
      flex: 4,
      child: LoginOTPContainer(
        isLoginScreen: true,
        elements: [
          SizedBox(height: 32),
          LoginPhoneInput(),
          LoginButton(isLoginScreen: true),
          LoginLegal(),
        ],
      ),
    );
  }
}
