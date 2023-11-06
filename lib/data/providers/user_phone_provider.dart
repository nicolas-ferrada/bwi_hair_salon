// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserPhoneProvider extends ChangeNotifier {
  String? _userPhone;
  UserPhoneProvider({
    int? userPhone,
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
}
