import 'package:flutter/material.dart';
import 'package:barbellplus/shared/header.dart';
import 'package:barbellplus/profile/personal_stats.dart';
import 'package:barbellplus/profile/image_gallery.dart';
import 'package:barbellplus/profile/function_list.dart';
import 'package:barbellplus/services/auth.dart';
import 'package:barbellplus/home/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppHeader(),
        PersonalStats(),
        ImageGallery(),
        FunctionList(),
      ],
    );
  }
}

// Widget buildSignOutButton(BuildContext context) {
//     return ElevatedButton(
//       child: const Text('signout'),
//       onPressed: () async {
//         await AuthService().signOut();
//         // ignore: use_build_context_synchronously
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomeScreen()),
//         );
//       },
//     );
//   }
