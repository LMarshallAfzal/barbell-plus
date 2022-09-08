import 'package:barbellplus/home/home.dart';
import 'package:barbellplus/services/auth.dart';
import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () async {
          await AuthService().signOut();
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
        child: const Text('Sign Out',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            )),
      ),
    );
  }
}
