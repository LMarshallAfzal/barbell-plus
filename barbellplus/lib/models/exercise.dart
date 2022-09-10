import 'package:flutter/material.dart';

enum RecordType {
  weightAndReps,
  repsOnly,
  time,
  timeAndWeight,
  distance,
}

class Exercise {
  final int id;
  final AssetImage image;
  final String name;
  final String description;
  final RecordType recordType;
  final String primaryMuscleGroup;
  final List<String> secondaryMuscleGroup;

  Exercise({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.recordType,
    required this.primaryMuscleGroup,
    required this.secondaryMuscleGroup,
  });
}

final List<Exercise> exercises = [
  Exercise(
      id: 1,
      image: const AssetImage('assets/images/squat.jpg'),
      name: 'Barbell Squat',
      description:
          'The squat is a compound, full body exercise that trains primarily the glutes and quads.',
      recordType: RecordType.weightAndReps,
      primaryMuscleGroup: 'Glutes',
      secondaryMuscleGroup: ['Quadriceps', 'Hips', 'Obliques']),
  Exercise(
      id: 2,
      image: const AssetImage('assets/images/bench-press.jpg'),
      name: 'Bench Press',
      description:
          'The bench press is a strength training exercise that consists of pressing a weight upwards from a supine position.',
      recordType: RecordType.weightAndReps,
      primaryMuscleGroup: 'Pecs',
      secondaryMuscleGroup: ['Front Delts', 'Triceps']),
  Exercise(
      id: 3,
      image: const AssetImage('assets/images/deadlift.jpg'),
      name: 'Deadlift',
      description:
          'The deadlift is a weight training exercise in which a loaded barbell or bar is lifted off the ground to the level of the hips, torso perpendicular to the floor, before being placed back on the ground.',
      recordType: RecordType.weightAndReps,
      primaryMuscleGroup: 'Glutes',
      secondaryMuscleGroup: ['Quadriceps', 'Hips', 'Obliques']),
  Exercise(
      id: 4,
      image: const AssetImage('assets/images/overhead-press.jpg'),
      name: 'Overhead Press',
      description:
          'The overhead press is a weight training exercise in which a weight is pressed straight up from racking position until the arms are locked out overhead.',
      recordType: RecordType.weightAndReps,
      primaryMuscleGroup: 'Front Delts',
      secondaryMuscleGroup: ['Triceps', 'Pecs']),
  Exercise(
    id: 5,
    image: const AssetImage('assets/images/barbell-row.jpg'),
    name: 'Barbell Row',
    description:
        'The barbell row is a compound exercise that primarily targets the middle back muscles.',
    recordType: RecordType.weightAndReps,
    primaryMuscleGroup: 'Lats',
    secondaryMuscleGroup: ['Romboids', 'Traps'],
  ),
  Exercise(
      id: 6,
      image: const AssetImage('assets/images/chin-up.jpg'),
      name: 'Chin Up',
      description:
          'The chin-up is an upper-body compound pulling exercise that works the biceps, lats, and the muscles of the upper back.',
      recordType: RecordType.repsOnly,
      primaryMuscleGroup: 'Biceps',
      secondaryMuscleGroup: ['Brachialis', 'Lats']),
  Exercise(
      id: 7,
      image: const AssetImage('assets/images/dips.jpg'),
      name: 'Dips',
      description: 'The dip is a strength exercise that targets triceps.',
      recordType: RecordType.repsOnly,
      primaryMuscleGroup: 'Triceps',
      secondaryMuscleGroup: ['Pecs']),
  Exercise(
      id: 7,
      image: const AssetImage('assets/images/preacher-curl.jpg'),
      name: 'Preacher Curls',
      description:
          'The preacher curls is a strength exercise that targets the bicep',
      recordType: RecordType.weightAndReps,
      primaryMuscleGroup: 'Biceps',
      secondaryMuscleGroup: ['Forearms']),
];
