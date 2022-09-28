import 'package:barbellplus/services/firestore.dart';
import 'package:barbellplus/services/models.dart';
import 'package:flutter/material.dart';

// exercise list widget which contains a list of all exercises inside this workout sesssion. The class should take a WorkoutSession as a parameter and then use the exercises inside the session to build the list.
class SessionExerciseList extends StatelessWidget {
  final List<WorkoutExercise> exercises;

  const SessionExerciseList({Key? key, required this.exercises})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) => SessionItem(
          exercise: exercises[index],
          exerciseData: exercises[index].name,
        ),
      ),
    );
  }
}

class SessionItem extends StatelessWidget {
  final Object exercise;
  final String exerciseData;

  const SessionItem(
      {Key? key, required this.exercise, required this.exerciseData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getExercise(exerciseData),
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

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    snapshot.data.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          );
        });
  }
}
