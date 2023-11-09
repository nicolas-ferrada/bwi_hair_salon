import 'package:flutter/material.dart';

class AppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHome({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: userData(),
      actions: icons(),
    );
  }

  Widget userData() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        'Good morning',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  List<Widget> icons() {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined, color: Colors.black),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.star_outline, color: Colors.black),
      )
    ];
  }
}
