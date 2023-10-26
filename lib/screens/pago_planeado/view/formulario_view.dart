// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/pagos_planeados_provider.dart';

class FormularioView extends StatefulWidget {
  const FormularioView({Key? key}) : super(key: key);

  @override
  State<FormularioView> createState() => _FormularioViewState();
}

class _FormularioViewState extends State<FormularioView> {
  final lista = [
    TipoClase(
      tipo: 0,
      nTipo: "Semanal",
      hintText: "Que dias quieres agendar",
    ),
    TipoClase(
      tipo: 1,
      nTipo: "Quincenal",
      hintText: "Quincenal",
    ),
    TipoClase(
      tipo: 2,
      nTipo: "Mensual",
      hintText: "Cando quieres agendar",
    ),
    TipoClase(
      tipo: 3,
      nTipo: "Anual",
      hintText: "para Cando quieres agendar",
    ),
  ];

  TipoClase? balor;

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    balor = lista.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final pr = context.read<PagosPlaneadosProvider>();

    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Monto"),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "El campo no puede ser vacio";
              }

              if (double.tryParse(value ?? "") == null) {
                return "Ingrese un dato numerico";
              }

              return null;
            },
            onSaved: (newValue) => pr.monto = double.parse(newValue!),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Descripcion",
            ),
            onSaved: (newValue) => pr.detalles =
                (newValue ?? "").isEmpty ? "Nuevo movimiento" : newValue!,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: theme.primary),
                borderRadius: BorderRadius.circular(30)),
            child: DropdownButton<TipoClase>(
              value: balor,
              // icon: const Icon(Icons.arrow_downward),
              borderRadius: BorderRadius.circular(30),
              elevation: 16,
              style: const TextStyle(),
              underline: Container(),
              onChanged: (TipoClase? value) => setState(() => balor = value!),
              items: lista.map<DropdownMenuItem<TipoClase>>((TipoClase value) {
                return DropdownMenuItem<TipoClase>(
                  value: value,
                  child: Text(
                    value.nTipo,
                    style: TextStyle(color: theme.primary),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          (balor!.tipo != 1)
              ? TextFormField(
                  decoration: InputDecoration(hintText: balor!.hintText),
                  onSaved: (newValue) => pr.cuando = newValue,
                )
              : Container(),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: SvgPicture.asset("assets/icons/cancel_button.svg"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () async{
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();

                      await pr.guardarPago();
                    }
                  },
                  child: const Text("Agregar"))
            ],
          )
        ],
      ),
    );
  }
}

class TipoClase {
  int tipo;
  String nTipo;
  String hintText;
  TipoClase({
    required this.tipo,
    required this.nTipo,
    required this.hintText,
  });

  TipoClase copyWith({
    int? tipo,
    String? nTipo,
    String? hintText,
  }) {
    return TipoClase(
      tipo: tipo ?? this.tipo,
      nTipo: nTipo ?? this.nTipo,
      hintText: hintText ?? this.hintText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipo': tipo,
      'nTipo': nTipo,
      'hintText': hintText,
    };
  }

  factory TipoClase.fromMap(Map<String, dynamic> map) {
    return TipoClase(
      tipo: map['tipo'] as int,
      nTipo: map['nTipo'] as String,
      hintText: map['hintText'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoClase.fromJson(String source) =>
      TipoClase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TipoClase(tipo: $tipo, nTipo: $nTipo, hintText: $hintText)';

  @override
  bool operator ==(covariant TipoClase other) {
    if (identical(this, other)) return true;

    return other.tipo == tipo &&
        other.nTipo == nTipo &&
        other.hintText == hintText;
  }

  @override
  int get hashCode => tipo.hashCode ^ nTipo.hashCode ^ hintText.hashCode;
}
