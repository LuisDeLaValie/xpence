import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'provider/calendario_provider.dart';
import 'views/calendario_view.dart';
import 'views/movimintos_view.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalendarioProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Calendario de gastos y pagos programados"),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: SvgPicture.asset("assets/icons/salir_x.svg"),
                    )
                  ],
                ),
                const CalendarioView(),
                Divider(
                  height: 25,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const Expanded(child: MovimintosView())
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.goNamed("planeado");
          },
          icon: SvgPicture.asset(
              "assets/icons/ant-design_clock-circle-outlined.svg"),
          label: const Text("Planear gasto"),
        ),
      ),
    );
  }
}
