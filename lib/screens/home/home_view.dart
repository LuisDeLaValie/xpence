import 'package:flutter/material.dart';
import 'package:xpence/screens/home/widgets/movimintos.dart';

import 'widgets/gatsos.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: Gatsos()),
        Divider(height: 1,endIndent: 20),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 1),
            child: Movimintos(),
          ),
        ),
      ],
    );
  }
}
