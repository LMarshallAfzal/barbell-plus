import 'package:flutter/material.dart';
import 'package:barbellplus/shared/bottom_nav.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
