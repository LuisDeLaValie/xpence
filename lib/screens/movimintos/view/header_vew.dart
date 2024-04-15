import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/monto_provider.dart';

class HeaderVew extends StatelessWidget {
  const HeaderVew({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Selector<MontoProvider, bool>(
        builder: (context, value, child) {
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Añadir movimiento"),
                    Text(
                      "Nuevo",
                      style: textTheme.displayMedium,
                    ),
                    if (value)
                      Text(
                        "Ingreso",
                        style: textTheme.displayMedium,
                      ),
                    if (!value)
                      Text(
                        "Gasto",
                        style: textTheme.displayMedium,
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      context.read<MontoProvider>().isEgreso = !value;
                    },
                    icon: AnimatedRotation(
                      turns: value ? 0 : 0.5,
                      duration: const Duration(milliseconds: 100),
                      child: SvgPicture.asset(
                        "assets/icons/flechas_indicador_moviminto.svg",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        selector: (p0, p1) => p1.isEgreso,
      ),
    );
  }
}
