import 'package:barbellplus/services/models.dart';
import 'package:barbellplus/shared/small_header.dart';
import 'package:barbellplus/workout/allPrograms/program_list.dart';
import 'package:flutter/material.dart';

class AllProgramsScreen extends StatelessWidget {
  final List<Workout> programs;
  const AllProgramsScreen({Key? key, required this.programs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SmallAppHeader(
          title: 'All Programs',
        ),
        ProgramList(
          programs: programs,
        ),
      ],
    );
  }
}
