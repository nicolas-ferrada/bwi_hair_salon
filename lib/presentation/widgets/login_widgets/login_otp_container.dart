import 'package:flutter/material.dart';

class LoginOTPContainer extends StatelessWidget {
  final List<Widget> elements;
  final bool isLoginScreen;
  const LoginOTPContainer({
    super.key,
    required this.elements,
    required this.isLoginScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        container(),
        Positioned(
          top: -50,
          child: isLoginScreen ? iconLogin() : iconOTP(),
        ),
      ],
    );
  }

  Widget iconLogin() {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 90,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.person_outline_outlined,
              size: 52,
            ),
            Positioned(
              right: 10,
              child: Icon(Icons.arrow_forward, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconOTP() {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 90,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 18,
              child: Icon(
                Icons.lock_outline,
                size: 42,
              ),
            ),
            Positioned(
              bottom: 10,
              child: Icon(Icons.password, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  Widget container() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...elements,
        ],
      ),
    );
  }
}
