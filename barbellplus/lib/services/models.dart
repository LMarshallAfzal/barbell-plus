import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

enum RecordType {
  weightAndReps,
  repsOnly,
  time,
  timeAndWeight,
  distance,
}

@JsonSerializable()
class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String password;
  final String image;
  final bool isAdmin;

  User(
      {this.id = 0,
      this.username = '',
      this.name = '',
      this.email = '',
      this.password = '',
      this.image = '',
      this.isAdmin = false});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Exercise {
  final String id;
  final String name;
  final String equipment;
  final String difficulty;
  final String image;
  final String muscle;

  Exercise(
      {this.id = '',
      this.name = '',
      this.equipment = '',
      this.difficulty = '',
      this.image = '',
      this.muscle = ''});

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}

@JsonSerializable()
class Workout {
  String id;
  String image;
  String name;
  String description;
  int duration;
  int numberOfSessions;
  List<WorkoutSession> sessions;

  Workout(
      {this.id = '',
      this.image = '',
      this.name = '',
      this.description = '',
      this.duration = 4,
      this.numberOfSessions = 4,
      this.sessions = const []});

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}

@JsonSerializable()
class WorkoutSession {
  String name;
  String image;
  String description;
  List<WorkoutExercise> exercises;

  WorkoutSession(
      {this.name = '',
      this.image = '',
      this.description = '',
      this.exercises = const []});

  factory WorkoutSession.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutSessionToJson(this);
}

@JsonSerializable()
class WorkoutExercise {
  String name;
  List<String> targetReps;
  List<String> sets;
  List<String> reps;
  List<String> weight;
  int rest;

  WorkoutExercise(
      {this.name = '',
      this.targetReps = const [],
      this.sets = const [],
      this.reps = const [],
      this.weight = const [],
      this.rest = 0});

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutExerciseToJson(this);
}
