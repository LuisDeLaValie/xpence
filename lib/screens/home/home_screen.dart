import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: HomeView(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.goNamed("moviminto");
        },
        label: const Text("Movimiento"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
