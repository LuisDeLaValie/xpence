import 'package:flutter/material.dart';

import 'views/calendario_view.dart';
import 'views/movimintos_view.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           CalendarioView(),
           Expanded(child: MovimintosView  ())
          ],
        ),
      ),
    );
  }
}
