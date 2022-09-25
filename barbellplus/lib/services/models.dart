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

// Sample document from the 'workouts' collection
// {
//   "id": "upper-lower-4-day",
//   "name": "Upper-Lower 4 Day",
//   "description": "This is a 4 day upper-lower split workout.",
//   "image": "default.png",
//   "numberOfSessions": 4,
//   "duration": 8,
//   "sessions": [
//     {
//       "name": "Upper Body",
//       "description": "This is the upper body session.",
//       "exercises": [
//         {
//           "name": "exercises/bench-press",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/overhead-press",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/barbell-row",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/lat-pulldown",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/face-pull",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/shoulder-press",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         }
//       ]
//     },
//     {
//       "name": "Lower Body",
//       "description": "This is the lower body session.",
//       "exercises": [
//         {
//           "name": "exercises/squat",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/deadlift",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/leg-press",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/leg-curl",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/leg-extension",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/calf-raise",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         }
//       ]
//     },
//     {
//       "name": "Upper Body",
//       "description": "This is the upper body session.",
//       "exercises": [
//         {
//           "name": "exercises/bench-press",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/overhead-press",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/barbell-row",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/lat-pulldown",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/face-pull",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/shoulder-press",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         }
//       ]
//     },
//     {
//       "name": "Lower Body",
//       "description": "This is the lower body session.",
//       "exercises": [
//         {
//           "name": "exercises/squat",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/deadlift",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/leg-press",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/leg-curl",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/leg-extension",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         },
//         {
//           "name": "exercises/calf-raise",
//           "targetReps": [8, 8, 8],
//           "sets": [3, 3, 3],
//           "reps": [],
//           "weight": [],
//           "rest": 60
//         }
//       ]
//     }
//   ]
// }

// Create a @jsonserializable class for the workout using the sample document above
@JsonSerializable()
class Workout {
  String id;
  String name;
  String description;
  int duration;
  int numberOfSessions;
  List<WorkoutSession> sessions;

  Workout(
      {this.id = '',
      this.name = '',
      this.description = '',
      this.duration = 4,
      this.numberOfSessions = 4,
      this.sessions = const []});

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}

// Create a @jsonserializable class for the workout session
@JsonSerializable()
class WorkoutSession {
  String name;
  String description;
  List<WorkoutExercise> exercises;

  WorkoutSession(
      {this.name = '', this.description = '', this.exercises = const []});

  factory WorkoutSession.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutSessionToJson(this);
}

// Create a @jsonserializable class for the workout exercise
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
