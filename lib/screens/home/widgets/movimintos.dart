import 'package:flutter/material.dart';

class Movimintos extends StatefulWidget {
  const Movimintos({Key? key}) : super(key: key);

  @override
  State<Movimintos> createState() => _MovimintosState();
}

class _MovimintosState extends State<Movimintos> {
  bool inEg = true;

  @override
  Widget build(BuildContext context) {
    final colorOpaco =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.38);

    final textTheme = Theme.of(context).textTheme;
    final textButton =
        textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold);
    final textButtonOpaco = textTheme.labelLarge!
        .copyWith(fontWeight: FontWeight.bold, color: colorOpaco);

    return Column(
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () => setState(() => inEg = true),
                child:
                    Text("Gastos", style: inEg ? textButton : textButtonOpaco)),
            TextButton(
                onPressed: () => setState(() => inEg = false),
                child: Text("Ingresos",
                    style: inEg ? textButtonOpaco : textButton)),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month))
          ],
        ),
        Expanded(
          child: ListView(
            children: List.generate(
              25,
              (index) {
                final showColor = index % 2 == 0;
                return ListTile(
                    title: const Text("Nombre del moviminto"),
                    subtitle: const Text("07/2/2026"),
                    trailing: const Text("\$ 35.34"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: showColor ? colorOpaco : null);
              },
            ),
          ),
        ),
      ],
    );
  }
}
