import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/color_palette.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 60),
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: ColorPalette.darkBlue(),
        ),
        onPressed: () {
          signOut();
        },
        child: const Text('Sign out'),
      ),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
