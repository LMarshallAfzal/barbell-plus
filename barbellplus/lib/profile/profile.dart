import 'package:flutter/material.dart';
import 'package:barbellplus/services/auth.dart';
import 'package:barbellplus/shared/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      // bottomNavigationBar: const BottomNavBar(),
      body: ElevatedButton(
          child: const Text('signout'),
          onPressed: () async {
            await AuthService().signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          }),
    );
  }
}
