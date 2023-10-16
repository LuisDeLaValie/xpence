import 'package:flutter/material.dart';
import 'package:xpence/utils/widget/calendario/calendario.dart';

class CalendarioView extends StatefulWidget {
  const CalendarioView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarioViewState createState() => _CalendarioViewState();
}

class _CalendarioViewState extends State<CalendarioView> {
  DateTime currentDate = DateTime.now();



CalendarioStyle calendarioStyle = CalendarioStyle(
    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Calendario(
      firstDate: DateTime(1997),
      lastDate: DateTime(2050),
      onDateChanged: (p0) {},
      initialDate: currentDate,
      markedDates: [
        DateTime(currentDate.year, currentDate.month, 15),
        DateTime(currentDate.year, currentDate.month, 30),
      ],
      cellStyle: calendarioStyle.copyWith(
        decoration: BoxDecoration(
          border:
              Border.all(color: colorScheme.onPrimary, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(8),
        ),
        style: const TextStyle(fontSize: 10),
      ),
      onCellStyle: calendarioStyle.copyWith(
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          border: Border.all(color: colorScheme.onPrimary),
          borderRadius: BorderRadius.circular(9),
        ),
        style: TextStyle(fontSize: 10, color: colorScheme.primary),
      ),
      markedcell: calendarioStyle.copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.onPrimary, width: 1),
          borderRadius: BorderRadius.circular(9),
        ),
        style: const TextStyle(fontSize: 10),
      ),
    );

    /*   return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        disableModePicker: false,
        calendarType: CalendarDatePicker2Type.multi,
        centerAlignModePicker: true,
        customModePickerIcon: SizedBox(),
        lastMonthIcon: SizedBox(),
        nextMonthIcon: SizedBox(),
        currentDate: currentDate,
        controlsTextStyle: textTheme.displaySmall,
        selectedDayHighlightColor: colorScheme.onPrimary,
        selectedDayTextStyle: textTheme.bodyMedium!.copyWith(color: colorScheme.primary),
        

      ),
      value: [
        DateTime(currentDate.year, currentDate.month, 15),
        DateTime(currentDate.year, currentDate.month, 30),
      ],
      onDisplayedMonthChanged: (value) => setState(() {
        currentDate = value;
      }),
      // onValueChanged: (dates) => _dates = dates,
    );
   */
  }
}
