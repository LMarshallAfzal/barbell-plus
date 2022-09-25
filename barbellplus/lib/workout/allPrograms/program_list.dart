// list of all workout programs available in the app (upper-lower, push-pull, etc). Using harcoded data NOT FROM FIRESTORE.
import 'package:barbellplus/models/fitness_program.dart';
import 'package:flutter/material.dart';

class ProgramList extends StatelessWidget {
  const ProgramList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: fitnessPrograms.length,
                  itemBuilder: (context, index) => ProgramItem(
                    program: fitnessPrograms[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgramItem extends StatelessWidget {
  final FitnessProgram program;

  // ignore: prefer_const_constructors_in_immutables
  ProgramItem({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/program',
          arguments: program,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: program.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              program.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
