import 'package:barbellplus/shared/small_header.dart';
import 'package:barbellplus/workout/programOverview/program_header.dart';
import 'package:barbellplus/workout/programOverview/session_list.dart';
import 'package:flutter/material.dart';

class ProgramOverviewScreen extends StatelessWidget {
  const ProgramOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SmallAppHeader(
          title: 'Program Overview',
        ),
        ProgramHeader(),
        SessionList(),
      ],
    );
  }
}
