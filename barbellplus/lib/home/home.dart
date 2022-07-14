import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('profile'),
          onPressed: () => Navigator.pushNamed(context, '/profile'),
        ),
      ),
    );
  }
}
