// import 'dart:html';

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
          buildContent(),
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

  Widget buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 78),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text('@lmarshallafzal',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          Text('Leonard Marshall Afzal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('110kg',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
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
        child: Image.asset(
          'assets/images/portfolio-cover.jpeg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ));
  }

  Widget buildProfileImage() {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: const AssetImage('assets/images/profile.png'),
    );
  }
}
