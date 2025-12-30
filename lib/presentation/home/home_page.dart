import 'package:flutter/material.dart';

import '../drawer/app_drawer.dart';
import '../puzzle/ui/puzzle_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: AppDrawer(),
      body: PuzzleView(),
    );
  }
}
