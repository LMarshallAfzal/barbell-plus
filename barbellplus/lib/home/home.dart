import 'package:flutter/material.dart';
import 'package:barbellplus/login/login.dart';
import 'package:barbellplus/workout/workout.dart';
import 'package:barbellplus/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return const LoadingScreen();
          return const Text('Loading...');
        } else if (snapshot.hasError) {
          return const Center(
            // child: ErrorMessage(),
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
          return const WorkoutScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
