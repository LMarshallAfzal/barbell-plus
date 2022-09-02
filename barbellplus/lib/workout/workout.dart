import 'package:flutter/material.dart';
import 'package:barbellplus/workout/activity.dart';
import 'package:barbellplus/workout/programs.dart';
import 'package:barbellplus/shared/header.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppHeader(),
        YourPrograms(),
        RecentActivities(),
      ],
    );
  }
}
