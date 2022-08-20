import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:barbellplus/network/network.dart';
import 'package:barbellplus/exercises/exercises.dart';
import 'package:barbellplus/profile/profile.dart';
import 'package:barbellplus/workout/workout.dart';
import 'package:barbellplus/history/history.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.dumbbell,
            size: 20,
          ),
          label: 'Workout',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.dumbbell,
            size: 20,
          ),
          label: 'Exercises',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.clockRotateLeft,
            size: 20,
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.networkWired,
            size: 20,
          ),
          label: 'Network',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.user,
            size: 20,
          ),
          label: 'Profile',
        ),
      ],
      fixedColor: Colors.deepPurple[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            Navigator.pushNamed(context, '/workout');
            break;
          case 1:
            Navigator.pushNamed(context, '/exercises');
            break;
          case 2:
            Navigator.pushNamed(context, '/history');
            break;
          case 3:
            Navigator.pushNamed(context, '/network');
            break;
          case 4:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
