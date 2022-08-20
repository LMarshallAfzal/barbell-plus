import 'package:flutter/material.dart';
import 'package:barbellplus/services/auth.dart';
import 'package:barbellplus/home/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          // buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  Widget buildSignOutButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('signout'),
      onPressed: () async {
        await AuthService().signOut();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
    );
  }

  Widget buildCoverImage() {
    return Container(
        color: Colors.grey[200],
        child: Image.network(
          'https://img.freepik.com/free-photo/low-angle-view-unrecognizable-muscular-build-man-preparing-lifting-barbell-health-club_637285-2497.jpg?w=600',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ));
  }

  Widget buildProfileImage() {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: const NetworkImage(
          'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
    );
  }
}
