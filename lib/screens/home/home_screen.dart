import 'package:flutter/material.dart';

import 'home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: HomeView(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Movimiento"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
