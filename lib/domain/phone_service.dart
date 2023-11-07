import 'package:bwi_hair_salon/presentation/widgets/login_widgets/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as log;

class SignInWithPhoneService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<void> verifyPhoneNumber({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          log.log('verificationCompleted');
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          log.log('failed');
          throw Exception(error.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          log.log('code sent');
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
      throw Exception(error);
    }
  }

  static Future<void> verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } catch (error) {
      throw Exception(error);
    }
  }
}
