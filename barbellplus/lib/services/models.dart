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
  final String id;
  final String name;
  final String description;
  final String image;
  final int numberOfSessions;
  final int durationInWeeks;
  final List<Session> sessions;

  Workout(
      {this.id = '',
      this.name = '',
      this.description = '',
      this.image = 'default.png',
      this.numberOfSessions = 0,
      this.durationInWeeks = 0,
      this.sessions = const []});

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}

@JsonSerializable()
class Session {
  final String name;
  final String description;
  final List<ExerciseElement> exercises;

  Session({this.name = '', this.description = '', this.exercises = const []});

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

@JsonSerializable()
class ExerciseElement {
  final int id;
  final Exercise? exercise;
  final List<int> targetReps;
  final List<int> targetSets;
  final List<int> sets;
  final List<int> reps;
  final List<int> weight;
  final int rest;

  ExerciseElement(
      {this.id = 0,
      this.exercise,
      this.targetReps = const [],
      this.targetSets = const [],
      this.sets = const [],
      this.reps = const [],
      this.weight = const [],
      this.rest = 0});

  factory ExerciseElement.fromJson(Map<String, dynamic> json) =>
      _$ExerciseElementFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseElementToJson(this);
}
