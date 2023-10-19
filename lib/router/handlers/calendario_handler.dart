import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:xpence/screens/calendario/calendario_screen.dart';
import 'package:xpence/screens/pago_planeado/pago_planeado_screen.dart';

Widget calendarioHandler(BuildContext context, GoRouterState state) {
  return const CalendarioScreen();
}

Widget PlanearPagosHandler(BuildContext context, GoRouterState state) {
  return const PagoPlaneadoScreen();
}