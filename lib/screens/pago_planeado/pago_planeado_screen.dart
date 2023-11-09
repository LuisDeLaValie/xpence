import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/theme/color_theme.dart';
import 'provider/pagos_planeados_provider.dart';
import 'view/formulario_view.dart';

class PagoPlaneadoScreen extends StatelessWidget {
  const PagoPlaneadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeLight,
      child: Builder(builder: (context) {
        final textTheme = Theme.of(context).textTheme;

        return ChangeNotifierProvider(
          create: (context) => PagosPlaneadosProvider(),
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Planear gasto"),
                      Text(
                        "Pago \nProgramado",
                        style: textTheme.displayMedium,
                      ),
                      const FormularioView(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
