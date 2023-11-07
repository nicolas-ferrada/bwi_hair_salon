import 'dart:async';

import 'package:bwi_hair_salon/data/providers/user_phone_provider.dart';
import 'package:bwi_hair_salon/domain/phone_service.dart';
import 'package:bwi_hair_salon/presentation/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPResendCode extends StatefulWidget {
  final int? resendOTP;
  const OTPResendCode({
    super.key,
    required this.resendOTP,
  });

  @override
  State<OTPResendCode> createState() => _OTPResendCodeState();
}

class _OTPResendCodeState extends State<OTPResendCode> {
  Timer? timer;
  static const int timerDuration = 60;
  int currentTime = timerDuration;

  bool isResendCodeAvailable = false;

  @override
  void initState() {
    super.initState();
    startResendCountdown();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (isResendCodeAvailable == false)
        ? textCountdown()
        : textButtonResendCode();
  }

  Widget textCountdown() {
    return Text(
      'Resend code in $currentTime s',
      style: const TextStyle(
        color: Colors.red,
      ),
    );
  }

  Widget textButtonResendCode() {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: resendCode,
      child: const Text(
        'Resend code!',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  void resendCode() async {
    try {
      await SignInWithPhoneService.verifyPhoneNumber(
        context: context,
        phoneNumber: context.read<UserPhoneProvider>().getUserPhone(),
        resendOTP: widget.resendOTP,
      );
      setState(() {
        isResendCodeAvailable = false;
      });
      startResendCountdown();
    } catch (error) {
      // ignore: use_build_context_synchronously
      ShowSnackbar().show(context: context, message: error.toString());
    }
  }

  void startResendCountdown() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (currentTime > 0) {
          setState(() => currentTime--);
        }
        // Timer got to zero
        else {
          timer?.cancel();
          setState(() {
            isResendCodeAvailable = true;
            currentTime = timerDuration;
          });
        }
      },
    );
  }
}
