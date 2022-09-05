import 'package:flutter/material.dart';
import 'package:barbellplus/shared/header.dart';
import 'package:barbellplus/exercises/search_bar.dart';
import 'package:barbellplus/exercises/exercise_list.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppHeader(),
        SearchBar(),
        ExerciseList(),
      ],
    );
  }
}
