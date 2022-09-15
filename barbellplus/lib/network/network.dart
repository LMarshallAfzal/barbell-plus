import 'package:barbellplus/network/feed.dart';
import 'package:barbellplus/shared/header.dart';
import 'package:flutter/material.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppHeader(),
        Feed(),
      ],
    );
  }
}
