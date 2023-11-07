import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/user_phone_provider.dart';

class OTPCodeInput extends StatefulWidget {
  const OTPCodeInput({super.key});

  @override
  State<OTPCodeInput> createState() => _OTPCodeInputState();
}

class _OTPCodeInputState extends State<OTPCodeInput> {
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();
  TextEditingController pin6 = TextEditingController();

  @override
  void dispose() {
    pin1.dispose();
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
    pin5.dispose();
    pin6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Form(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          codeNumberTile(context: context, controller: pin1),
          codeNumberTile(context: context, controller: pin2),
          codeNumberTile(context: context, controller: pin3),
          codeNumberTile(context: context, controller: pin4),
          codeNumberTile(context: context, controller: pin5),
          codeNumberTile(context: context, controller: pin6),
        ],
      )),
    );
  }

  Widget codeNumberTile({
    required BuildContext context,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: 40,
      child: TextFormField(
        maxLength: 6,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(counterText: ""),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
        controller: controller,
        onChanged: (value) {
          context.read<UserPhoneProvider>().changeUserOTP(
                newUserOTP:
                    '${pin1.text}${pin2.text}${pin3.text}${pin4.text}${pin5.text}${pin6.text}',
              );
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          } else if (value.length == 6) {
            pin1.text = value[0];
            pin2.text = value[1];
            pin3.text = value[2];
            pin4.text = value[3];
            pin5.text = value[4];
            pin6.text = value[5];
          } else if (value.length != 6 ||
              value.length != 1 ||
              value.isNotEmpty) {
            // Don't allow to paste multiple numbers in one textformfield (if not 6, 1 or delete)
            // Problem: if writes their code and try to paste some part of the code and not
            // all of it, all the code will be deleted.
            pin1.text = '';
            pin2.text = '';
            pin3.text = '';
            pin4.text = '';
            pin5.text = '';
            pin6.text = '';
          }
        },
      ),
    );
  }
}
