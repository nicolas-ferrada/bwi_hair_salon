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
        maxLength: 1,
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
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
