import 'package:bwi_hair_salon/presentation/widgets/login_widgets/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInWithPhoneService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<void> verifyPhoneNumber({
    required BuildContext context,
    required String phoneNumber,
    int? resendOTP,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        forceResendingToken: resendOTP,
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) => throw Exception(error.toString()),
        codeSent: (verificationId, forceResendingToken) {
          if (resendOTP == null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTP(
                  verificationId: verificationId,
                  resendOTP: forceResendingToken,
                ),
              ),
            );
          }
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      throw Exception(e);
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
