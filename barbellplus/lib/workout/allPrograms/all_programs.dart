import 'package:barbellplus/shared/small_header.dart';
import 'package:barbellplus/workout/allPrograms/program_list.dart';
import 'package:flutter/material.dart';

class AllProgramsScreen extends StatelessWidget {
  const AllProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SmallAppHeader(
          title: 'All Programsi',
        ),
        ProgramList(),
      ],
    );
  }
}
