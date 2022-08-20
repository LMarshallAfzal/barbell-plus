import 'package:barbellplus/network/network.dart';
import 'package:barbellplus/exercises/exercises.dart';
import 'package:barbellplus/profile/profile.dart';
import 'package:barbellplus/workout/workout.dart';
import 'package:barbellplus/history/history.dart';
import 'package:barbellplus/theme.dart';
import 'package:flutter/material.dart';
// import 'package:barbellplus/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: appRoutes,
      home: const MainScreen(),
      theme: appTheme,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color mainColor = const Color(0xFF2631C1);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Barbell Plus'),
      //   elevation: 0,
      //   backgroundColor: mainColor,
      // ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          WorkoutScreen(),
          ExercisesScreen(),
          HistoryScreen(),
          NetworkScreen(),
          ProfileScreen(),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.dumbbell),
        title: ('Exercises'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey[600],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.dumbbell),
        title: ('Workout'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey[600],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.clockRotateLeft),
        title: ('History'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey[600],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.networkWired),
        title: ('Network'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey[600],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.user),
        title: ('Profile'),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey[600],
      ),
    ];
  }
}
