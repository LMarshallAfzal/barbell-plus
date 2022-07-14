import 'package:barbellplus/login/login.dart';
import 'package:barbellplus/profile/profile.dart';
import 'package:barbellplus/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
};

