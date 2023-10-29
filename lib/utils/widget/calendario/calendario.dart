import 'package:flutter/material.dart';
import 'package:tdtxle_data_format/date_time_extents.dart';

class Calendario extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  final double? width;
  final double? height;
  final CalendarioStyle? cellStyle;
  final CalendarioStyle? onCellStyle;
  final CalendarioStyle? markedcell;
  final List<DateTime>? markedDates;

  final void Function(DateTime) onDateChanged;

  const Calendario({
    super.key,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.width,
    this.height,
    this.cellStyle,
    this.onCellStyle,
    this.markedcell,
    this.markedDates,
    required this.onDateChanged,
  });

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  final List<String> dias = [
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado',
    'Domingo'
  ];

  late DateTime _currentDate;
  DateTime? _selectedDate;
  @override
  void initState() {
    super.initState();
    _currentDate = widget.initialDate ?? DateTime.now();
    _selectedDate = widget.initialDate;
    _clear();
  }

  late List<TableRow> table;

  Widget celdas(DateTime date, CalendarioStyle? style) {
    return TableCell(
      child: InkWell(
        onTap: () {
          widget.onDateChanged(date);
          setState(() {
            _selectedDate = date;
          });
        },
        child: Container(
          decoration: style?.decoration,
          padding: style?.padding,
          margin: style?.margin,
          child: Center(
            child: Text(
              '${date.day}',
              style: style?.style,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _clear();
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                _currentDate.format("Mmm Y"),
                style: const TextStyle(fontSize: 30),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  var data = _currentDate
                      .subtract(Duration(days: (32 - _currentDate.day)));
                  if (data.isAfter(widget.firstDate)) {
                    setState(() {
                      _currentDate = data;
                    });
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  var data =
                      _currentDate.add(Duration(days: (32 + _currentDate.day)));
                  if (data.isBefore(widget.lastDate)) {
                    setState(() {
                      _currentDate = data;
                    });
                  }
                },
              ),
            ],
          ),
          Table(
            border: TableBorder.all(width: 1, style: BorderStyle.none),
            children: [
              TableRow(
                children: dias
                    .map(
                      (e) => TableCell(
                        child: Center(child: Text(e.characters.first)),
                      ),
                    )
                    .toList(),
              ),
              ...generateCalendar(),
            ],
          ),
        ],
      ),
    );
  }

  generateCalendar() {
    DateTime aux = DateTime(_currentDate.year, _currentDate.month);

    int ultimodia = 0;
    // generar tabla del calendario
    while (aux.month == _currentDate.month) {
      table[aux.weekMonth - 1].children[aux.weekday - 1] =
          celdas(aux, widget.cellStyle);
      ultimodia = aux.day;
      aux = aux.add(const Duration(days: 1));
    }

    var listas = widget.markedDates?.where(
          (element) => element.between(
            DateTime(_currentDate.year, _currentDate.month, 1),
            DateTime(_currentDate.year, _currentDate.month, ultimodia),
          ),
        ) ??
        [];
    // establecer seldas marcadas
    for (var item in listas) {
      table[item.weekMonth - 1].children[item.weekday - 1] =
          celdas(item, widget.markedcell);
    }
    // establecer celda seleccionada
    if (_selectedDate != null) {
      table[_selectedDate!.weekMonth - 1].children[_selectedDate!.weekday - 1] =
          celdas(_selectedDate!, widget.onCellStyle);
    }

    return table;
  }

  void _clear() {
    table = List<TableRow>.generate(
      6,
      (index) => TableRow(
        children: List<Widget>.generate(
          7,
          (index2) => TableCell(
            child: Container(
              decoration: widget.cellStyle?.decoration,
              padding: widget.cellStyle?.padding,
              margin: widget.cellStyle?.margin,
              child: const Center(child: Text('')),
            ),
          ),
        ).toList(),
      ),
    );
  }
}

class CalendarioStyle {
  final BoxDecoration? decoration;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  CalendarioStyle({
    this.decoration,
    this.style,
    this.padding,
    this.margin,
  });

  CalendarioStyle copyWith({
    BoxDecoration? decoration,
    TextStyle? style,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return CalendarioStyle(
      decoration: decoration ?? this.decoration,
      style: style ?? this.style,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
    );
  }
}
