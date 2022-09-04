import 'package:flutter/material.dart';
import 'package:barbellplus/history/stats.dart';
import 'package:barbellplus/history/info.dart';
import 'package:barbellplus/history/graph.dart';
import 'package:barbellplus/history/dates.dart';
import 'package:barbellplus/shared/header.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppHeader(),
        Dates(),
        Graph(),
        Info(),
        Stats(),
      ],
    );
  }
}
