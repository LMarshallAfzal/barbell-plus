// import 'package:barbellplus/models/workout_days.dart';
import 'package:barbellplus/services/firestore.dart';
import 'package:barbellplus/services/models.dart';
import 'package:flutter/material.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({super.key});
  final workoutId = 'kcl-barbell-program-leonard-basic-strength-v1';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Workout>(
        future: FirestoreService().getWorkout(workoutId),
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
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Recent Activities',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.numberOfSessions,
                      itemBuilder: (context, index) => ActivityItem(
                        session: snapshot.data!.sessions[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class ActivityItem extends StatelessWidget {
  final WorkoutSession session;

  // ignore: prefer_const_constructors_in_immutables
  ActivityItem({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/activity');
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffcff2ff)),
                height: 35,
                width: 35,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/bodybuilder-1.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text(session.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  )),
              const Expanded(child: SizedBox()),
              const Icon(Icons.timer, size: 12),
              const SizedBox(width: 5),
              Text(
                session.name,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.wb_sunny_outlined, size: 12),
              const SizedBox(width: 5),
              const Text(
                'test',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
            ],
          )),
    );
  }
}
