import 'package:barbellplus/services/firestore.dart';
import 'package:barbellplus/services/models.dart';
import 'package:barbellplus/workout/allPrograms/all_programs.dart';
import 'package:flutter/material.dart';

class YourPrograms extends StatelessWidget {
  const YourPrograms({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Workout>>(
      future: FirestoreService().getWorkouts(),
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
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Programs",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllProgramsScreen(),
                            ));
                      },
                    ),
                  ],
                )),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Program(
                      program: snapshot.data![index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 20)),
            )
          ],
        );
      },
    );
  }
}

class Program extends StatelessWidget {
  final Workout program;

  const Program({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 189, 182, 182).withOpacity(0.8),
              BlendMode.lighten),
          image: const AssetImage('assets/images/barbell-workout.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(15),
      child: DefaultTextStyle.merge(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(program.name),
          ],
        ),
      ),
    );
  }
}

// convert the above classes to be used with firebase firestore service

