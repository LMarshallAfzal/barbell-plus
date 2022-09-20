import 'package:barbellplus/models/fitness_program.dart';
import 'package:barbellplus/workout/program_list.dart';
import 'package:flutter/material.dart';

class YourPrograms extends StatefulWidget {
  const YourPrograms({super.key});

  @override
  State<YourPrograms> createState() => _YourProgramsState();
}

class _YourProgramsState extends State<YourPrograms> {
  ProgramType active = fitnessPrograms[0].type;

  @override
  Widget build(BuildContext context) {
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
                          builder: (context) => const ProgramList(),
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
              itemCount: fitnessPrograms.length,
              itemBuilder: (context, index) {
                return Program(
                  program: fitnessPrograms[index],
                  active: fitnessPrograms[index].type == active,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20)),
        )
      ],
    );
  }
}

class Program extends StatelessWidget {
  final FitnessProgram program;
  final bool active;

  const Program({
    Key? key,
    required this.program,
    required this.active,
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
              active
                  ? const Color.fromARGB(255, 209, 5, 5).withOpacity(0.8)
                  : const Color.fromARGB(255, 189, 182, 182).withOpacity(0.8),
              BlendMode.lighten),
          image: program.image,
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(15),
      child: DefaultTextStyle.merge(
        style: TextStyle(
          color: active ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(program.name),
            Row(
              children: [
                Text(program.calories),
                const SizedBox(width: 15),
                Icon(
                  Icons.timer,
                  size: 10,
                  color: active ? Colors.white : Colors.black,
                ),
                const SizedBox(width: 5),
                Text(program.time),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
