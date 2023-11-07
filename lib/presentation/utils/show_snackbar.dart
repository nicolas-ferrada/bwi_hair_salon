import 'package:flutter/material.dart';

class ShowSnackbar {
  void show({
    required BuildContext context,
    required String message,
  }) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
