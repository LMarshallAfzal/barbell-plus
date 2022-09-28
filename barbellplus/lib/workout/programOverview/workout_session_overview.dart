import 'package:barbellplus/services/firestore.dart';
import 'package:barbellplus/services/models.dart';
import 'package:barbellplus/shared/small_header.dart';
import 'package:barbellplus/workout/programOverview/session_exercise_list.dart';
import 'package:flutter/material.dart';

class WorkoutSessionOverviewScreen extends StatelessWidget {
  final WorkoutSession session;
  const WorkoutSessionOverviewScreen({Key? key, required this.session})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreService()
          .getWorkout('kcl-barbell-program-leonard-basic-strength-v1'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
                color: Color.fromARGB(255, 209, 5, 5)),
          );
        }
        return Column(
          children: [
            SmallAppHeader(
              title: session.name,
            ),
            SessionExerciseList(exercises: session.exercises),
          ],
        );
      },
    );
  }
}
