import 'package:barbellplus/services/firestore.dart';
import 'package:barbellplus/services/models.dart';
import 'package:flutter/material.dart';

class ProgramHeader extends StatelessWidget {
  const ProgramHeader({super.key});

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
        return SizedBox(
          width: double.infinity,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage((snapshot.data as Workout).image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.dstATop),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text(
                  (snapshot.data as Workout).name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  (snapshot.data as Workout).description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.timer,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${(snapshot.data as Workout).duration.toString()} weeks',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
