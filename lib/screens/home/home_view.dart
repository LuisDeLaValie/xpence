import 'package:flutter/material.dart';
import 'package:xpence/screens/home/widgets/movimintos.dart';

import 'widgets/gatsos.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: Gatsos()),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Movimintos(),
          ),
        ),
      ],
    );
  }
}
