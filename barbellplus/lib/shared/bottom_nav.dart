import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:barbellplus/network/network.dart';
import 'package:barbellplus/exercises/exercises.dart';
import 'package:barbellplus/profile/profile.dart';
import 'package:barbellplus/workout/workout.dart';
import 'package:barbellplus/history/history.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Color mainColor = const Color.fromARGB(255, 209, 5, 5);
  Color secondaryColor = const Color.fromARGB(255, 117, 117, 117);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          WorkoutScreen(),
          ExercisesScreen(),
          NetworkScreen(),
          HistoryScreen(),
          ProfileScreen(),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style6,
        backgroundColor: const Color.fromARGB(244, 210, 204, 204),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.clipboardList),
        title: ('Workout'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.dumbbell),
        title: ('Exercises'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.networkWired),
        title: ('Network'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.clockRotateLeft),
        title: ('History'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.user),
        title: ('Profile'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: secondaryColor,
      ),
    ];
  }
}
