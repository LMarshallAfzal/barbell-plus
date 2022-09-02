import 'package:flutter/material.dart';

enum ProgramType {
  active,
  inactive,
}

class FitnessProgram {
  final AssetImage image;
  final String name;
  final String calories;
  final String time;
  final ProgramType type;

  FitnessProgram({
    required this.image,
    required this.name,
    required this.calories,
    required this.time,
    required this.type,
  });
}

final List<FitnessProgram> fitnessPrograms = [
  FitnessProgram(
    image: const AssetImage('assets/images/dumbell-rack.jpg'),
    name: 'Volume Program',
    calories: '320kcal',
    time: '2hrs',
    type: ProgramType.active,
  ),
  FitnessProgram(
    image: const AssetImage('assets/images/sixpack.jpg'),
    name: 'Strength Program',
    calories: '400kcal',
    time: '2hrs',
    type: ProgramType.inactive,
  ),
  FitnessProgram(
    image: const AssetImage('assets/images/greyscale-lifter.jpg'),
    name: 'Hypertrophy Program',
    calories: '200kcal',
    time: '1hrs',
    type: ProgramType.inactive,
  ),
  FitnessProgram(
    image: const AssetImage('assets/images/deadlift.jpg'),
    name: 'Recovery Program',
    calories: '100kcal',
    time: '45mins',
    type: ProgramType.inactive,
  ),
];
