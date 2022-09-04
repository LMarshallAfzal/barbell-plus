// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:barbellplus/models/workout_days.dart';
import 'package:barbellplus/shared/helper.dart';
import 'package:flutter/material.dart';

class Dates extends StatelessWidget {
  const Dates({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateBox> dateBoxes = [];
    for (var i = 0; i < workoutDays.length; i++) {
      dateBoxes.add(DateBox(
        session: workoutDays[i],
        active: i == 0,
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dateBoxes,
      ),
    );
  }
}

class DateBox extends StatelessWidget {
  final bool active;
  final WorkoutDay session;

  // ignore: prefer_const_constructors_in_immutables
  DateBox({
    Key? key,
    required this.active,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 73,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        gradient: active
            ? const LinearGradient(
                colors: [
                  Color(0xff92e2ff),
                  Color(0xff1ebdf8),
                ],
                begin: Alignment.topCenter,
              )
            : null,
        border: Border.all(
          color: const Color(0xffe1e1e1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DefaultTextStyle.merge(
        style: active ? const TextStyle(color: Colors.white) : null,
        child: Column(
          children: [
            Text(weekdays[session.date.weekday]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                )),
            Text(session.date.day.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
          ],
        ),
      ),
    );
  }
}
