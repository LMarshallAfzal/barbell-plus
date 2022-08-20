import 'package:flutter/material.dart';
import 'package:barbellplus/shared/bottom_nav.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network'),
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
