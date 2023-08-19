import 'package:flutter/material.dart';
import 'package:xpence/screens/home/widgets/graficas.dart';
import 'package:xpence/screens/home/widgets/movimintos.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Expanded(child: Graficas()),
          Expanded(child: Movimintos()),
        ],
      ),
    );
  }
}
