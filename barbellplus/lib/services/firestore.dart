import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:barbellplus/services/auth.dart';
import 'package:barbellplus/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all documments from the users collection
  Future<List<User>> getUsers() async {
    var ref = _db.collection('users');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var users = data.map((d) => User.fromJson(d));
    return users.toList();
  }

  /// Retrieves a single user documentString
  Future<User> getUser(String userId) async {
    var ref = _db.collection('users').doc(userId);
    var snapshot = await ref.get();
    return User.fromJson(snapshot.data() ?? {});
  }

  /// Reads all documents from the exercises collection
  Future<List<Exercise>> getExercises() async {
    var ref = _db.collection('exercises');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var exercises = data.map((d) => Exercise.fromJson(d));
    return exercises.toList();
  }

  /// Retrieves a single exercise document
  Future<Exercise> getExercise(String exerciseId) async {
    var ref = _db.collection('exercises').doc(exerciseId);
    var snapshot = await ref.get();
    return Exercise.fromJson(snapshot.data() ?? {});
  }

  /// Reads all documents from the workouts collection
  Future<List<Workout>> getWorkouts() async {
    var ref = _db.collection('workouts');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var workouts = data.map((d) => Workout.fromJson(d));
    return workouts.toList();
  }

  /// Retrieves a single workout document
  Future<Workout> getWorkout(String workoutId) async {
    var ref = _db.collection('workouts').doc(workoutId);
    var snapshot = await ref.get();
    return Workout.fromJson(snapshot.data() ?? {});
  }
}
