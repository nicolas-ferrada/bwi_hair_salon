import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/otp.dart';

class PhoneService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static void signInWithPhone({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTP(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    }
  }

  static void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await _firebaseAuth
          .signInWithCredential(credential)
          .then((value) => Navigator.maybePop(context));
    } catch (error) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    }
  }
}
