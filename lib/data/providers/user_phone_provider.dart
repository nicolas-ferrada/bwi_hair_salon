// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserPhoneProvider extends ChangeNotifier {
  int? _userPhone;
  UserPhoneProvider({
    int? userPhone,
  });

  int getUserPhone() {
    if (_userPhone != null) {
      return _userPhone!;
    } else {
      throw Exception('No number was given');
    }
  }

  void changePhone({
    required int newUserPhone,
  }) {
    _userPhone = newUserPhone;
    notifyListeners();
  }
}
