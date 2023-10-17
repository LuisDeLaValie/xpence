import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/calendario_provider.dart';
import 'views/calendario_view.dart';
import 'views/movimintos_view.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalendarioProvider(),
      child:  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const CalendarioView(),
                Divider(height: 25,color: Theme.of(context).colorScheme.onPrimary,),
                const Expanded(child: MovimintosView())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
