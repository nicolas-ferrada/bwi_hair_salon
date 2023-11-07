// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserPhoneProvider extends ChangeNotifier {
  String? _userPhone;
  String? _userOTP;
  UserPhoneProvider({
    int? userPhone,
    int? userOTP,
  });

  String getUserPhone() {
    if (_userPhone != null) {
      return _userPhone!;
    } else {
      throw Exception('No number was given');
    }
  }

  void changePhone({
    required String newUserPhone,
  }) {
    _userPhone = newUserPhone;
    notifyListeners();
  }

  String getUserOTP() {
    if (_userOTP != null) {
      return _userOTP!;
    } else {
      throw Exception('No OTP was given');
    }
  }

  void changeUserOTP({
    required String newUserOTP,
  }) {
    _userOTP = newUserOTP;
    notifyListeners();
  }
}
