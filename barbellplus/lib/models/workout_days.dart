import 'package:flutter/material.dart';

class WorkoutDay {
  final AssetImage image;
  final String name;
  final String calories;
  final String time;
  final DateTime date;

  WorkoutDay({
    required this.image,
    required this.name,
    required this.calories,
    required this.time,
    required this.date,
  });
}

final List<WorkoutDay> workoutDays = [
  WorkoutDay(
      image: const AssetImage('assets/images/back.jpg'),
      name: 'Session 1',
      calories: '320kcal',
      time: '2hrs',
      date: DateTime.parse('2022-09-04')),
  WorkoutDay(
    image: const AssetImage('assets/images/lifter.jpg'),
    name: 'Session 2',
    calories: '400kcal',
    time: '2hrs',
    date: DateTime.parse('2022-09-03'),
  ),
  WorkoutDay(
    image: const AssetImage('assets/images/topless.jpg'),
    name: 'Session 3',
    calories: '200kcal',
    time: '1hrs',
    date: DateTime.parse('2022-09-01'),
  ),
  WorkoutDay(
    image: const AssetImage('assets/images/powerlifter-squat.jpg'),
    name: 'Session 4',
    calories: '100kcal',
    time: '45mins',
    date: DateTime.parse('2022-08-31'),
  ),
];