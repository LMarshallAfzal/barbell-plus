// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:barbellplus/models/workout_days.dart';
import 'package:barbellplus/shared/helper.dart';
import 'package:flutter/material.dart';

class Dates extends StatelessWidget {
  const Dates({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateBox> dateBoxes = [];

    DateTime date = DateTime.now().subtract(const Duration(days: 3));

    for (int i = 0; i < 6; i++) {
      dateBoxes.add(DateBox(
        date: date,
        active: i == 3,
      ));
      date = date.add(const Duration(days: 1));
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
  final DateTime date;

  // ignore: prefer_const_constructors_in_immutables
  DateBox({
    Key? key,
    required this.active,
    required this.date,
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
                  Color(0xffd44a4e),
                  Color(0xffde2f34),
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
            Text(weekdays[date.weekday]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                )),
            Text(date.day.toString().padLeft(2, '0'),
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
