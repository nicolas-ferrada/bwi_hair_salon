import 'package:bwi_hair_salon/presentation/utils/color_palette.dart';
import 'package:flutter/material.dart';


class LoginLegal extends StatelessWidget {
  const LoginLegal({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        const Text('By continuing you agree to our'),
        legalText(legalText: 'Terms & Conditions'),
        const Text(' and '),
        legalText(legalText: 'Privacy Policy'),
      ],
    );
  }

  Widget legalText({
    required String legalText,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {},
      child: Text(
        legalText,
        style: TextStyle(color: ColorPalette.darkBlue()),
      ),
    );
  }
}
