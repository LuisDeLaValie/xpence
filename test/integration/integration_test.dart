import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:xpence/data/database/hive_db.dart';
import 'package:xpence/screens/home/home_screen.dart';
import 'package:xpence/screens/login/login_screen.dart';

Future<void> main() async {
  Hive.init("./test/integration/database/lock");
  await openBoxes();
  testWidgets('Pagina de Login', (WidgetTester tester) async {
    // Crear un widget de prueba
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    //Probar mensje de bine venida
    expect(find.text('Bienvenido!'), findsOneWidget);
    expect(
        find.text(
            'A continuacion ingresa los datos requeridos para comenzar a usar Xpence'),
        findsOneWidget);

    // probar mensaje de validasiones al presionar el boton de continuar
    final botonContinuar = find.byKey(const Key("btn_continuar"));
    expect(botonContinuar, findsOneWidget);
    await tester.tap(botonContinuar);
    await tester.pumpAndSettle();
    expect(find.text('Ingrese un nombre'), findsOneWidget);
    expect(find.text('Ingrese un monto inicial'), findsOneWidget);

    // Probar textfield de nombre de usuario
    final textFieldnombre = find.byKey(const Key('Nombre Usuario'));
    await tester.enterText(textFieldnombre, 'Emilio');
    expect(find.text('Emilio'), findsOneWidget);
    // Probar textfield de monto inicial
    final textFieldmonto = find.byKey(const Key('monto inicial'));
    await tester.enterText(textFieldmonto, '1500');
    expect(find.text('1500'), findsOneWidget);

    // validar que el monto sea un dato numerico
    await tester.enterText(textFieldmonto, 'as');
    await tester.tap(botonContinuar);
    await tester.pumpAndSettle();
    expect(find.text('Solo se puede ingresar numeros'), findsOneWidget);

    // try {
    //   await expectLater(
    //     () async {
    //       await tester.enterText(textFieldmonto, '1500');
    //       await tester.tap(botonContinuar);
    //       await tester.pumpAndSettle();
    //     },
    //     throwsA(isA<Exception>()),
    //   ).catchError((dynamic error, StackTrace stackTrace) {
    //     Captura y maneja explícitamente la excepción
    //     print('Termino el proseso');
    //     Puedes realizar otras acciones o validaciones con la excepción capturada
    //   });
    // } catch (e) {
    //   print("object: ");
    // }
    // Validar que una excepción específica sea lanzada durante la ejecución de la prueba

    // expect(find.text('Solo se puede ingresar numeros'), findsNothing);
    // expect(find.text('Ingrese un nombre'), findsNothing);
    // expect(find.text('Ingrese un monto inicial'), findsNothing);
  });

  testWidgets("Pagina Home", (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));


  });
}
