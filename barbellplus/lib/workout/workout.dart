import 'package:flutter/material.dart';
import 'package:barbellplus/shared/bottom_nav.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout'),
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
