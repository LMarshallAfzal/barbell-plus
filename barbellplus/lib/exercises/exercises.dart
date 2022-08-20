import 'package:flutter/material.dart';
import 'package:barbellplus/shared/bottom_nav.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
