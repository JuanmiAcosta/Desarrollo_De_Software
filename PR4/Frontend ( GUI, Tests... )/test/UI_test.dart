import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pantalla_pedidos_hamburgueseria/main.dart';
import 'package:pantalla_pedidos_hamburgueseria/menu.dart';

void main() {

  testWidgets('Test de navegación al presionar botón "Para llevar"', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp()); // Esperamos (de manera asíncrona ) a la construcción de nuestra evntana principal
    final paraLlevarButton = find.text('Para llevar'); // y podemos encontrar los componentes por el nombre que les hayamos asignado

    await tester.tap(paraLlevarButton);
    await tester.pumpAndSettle(); // esperamos a que realmente hayamos navegado a la siguiente página

    expect(find.byType(Menu), findsOneWidget); // Estamos realmente en la página Menú?
  });

  testWidgets('Test de navegación al presionar botón "Para tomar aquí"', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final paraTomarAquiButton = find.text('Para tomar aquí');

    await tester.tap(paraTomarAquiButton);
    await tester.pumpAndSettle();

    expect(find.byType(Menu), findsOneWidget);
  });

  testWidgets('Agregar hamburguesa al carrito', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp( // al no ser la página principal, lo construimos así
      home: Menu(),
    ));

    expect(find.text('0'), findsOneWidget); // Para comprobar que hay "0" items en el carrito

    await tester.tap(find.text('Hamburguesa normal'));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('Hamburguesa vegana'));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.text('Hamburguesa sin gluten'));
    await tester.pump();

    expect(find.text('3'), findsOneWidget);
  });
}
