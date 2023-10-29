import 'package:flutter/material.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';
import 'package:xpence/utils/cconstantes.dart';
import 'package:xpence/utils/theme/color_schemes.dart';
import 'package:xpence/utils/theme/color_theme.dart';

class ImputFecha extends StatefulWidget {
  final InputDecoration decoration;
  final void Function(DateTime dateTime)? onChanged;
  const ImputFecha({super.key, required this.decoration, this.onChanged});

  @override
  _ImputFechaState createState() => _ImputFechaState();
}

class _ImputFechaState extends State<ImputFecha> {
  DateTime? fecha;
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      isEmpty: fecha == null,
      decoration: const InputDecoration(
        hintText: "Repetir cada x dias",
      ),
      child: InkWell(
        onTap: _presentDatePicker,
        child: Text(
          fecha?.format("D-M-Y") ?? "",
        ),
      ),
    );
  }

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: fechaInicio,
      lastDate: fechaFinal,
      builder: (context, child) {
        return CalendarioSelect(child: child!);
      },
    );

    if (pickedDate != null) {
      setState(() {
        fecha = pickedDate;
        widget.onChanged?.call(pickedDate);
      });
    }
  }
}

class CalendarioSelect extends StatelessWidget {
  final Widget child;
  const CalendarioSelect({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeLight.copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF0A45FA),
          ),
        ),
        colorScheme: lightColorScheme.copyWith(
          surface: const Color(0xFFFFFFFF),
          onInverseSurface: const Color(0xFF0A45FA),
        ),
      ),
      child: Builder(builder: (context) {
        return child;
      }),
    );
  }
}
