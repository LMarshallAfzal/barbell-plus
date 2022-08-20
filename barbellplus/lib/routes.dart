import 'package:barbellplus/login/login.dart';
import 'package:barbellplus/profile/profile.dart';
import 'package:barbellplus/home/home.dart';
import 'package:barbellplus/workout/workout.dart';
import 'package:barbellplus/network/network.dart';
import 'package:barbellplus/history/history.dart';
import 'package:barbellplus/exercises/exercises.dart';

var appRoutes = {
  // '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/workout': (context) => const WorkoutScreen(),
  '/network': (context) => const NetworkScreen(),
  '/history': (context) => const HistoryScreen(),
  '/exercises': (context) => const ExercisesScreen(),
};
