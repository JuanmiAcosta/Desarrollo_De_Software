import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pantalla_pedidos_hamburgueseria/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/Cocinero.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaNormalBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaSinGlutenBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaVeganaBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/ObservadorPedido.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/Pedido.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/Hamburguesa.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/DisplayPedidos.dart';

void main() {

  late HamburguesaNormalBuilder normalBuilder;
  //late Pedido pedidoactual ;
  late Cocinero cocinero ;
  late List<String> pedidoActualString;
  late bool pedidoCompletado;

  setUp(() {
    normalBuilder = HamburguesaNormalBuilder();
    cocinero = Cocinero.Parametros(normalBuilder);
    pedidoActualString = [];
    pedidoCompletado = false;

    // Añadir hamburguesa
    pedidoActualString.add('Hamburguesa normal');
  });


  testWidgets('Tiempo en crear hamburguesa', (WidgetTester tester) async{
    expect(pedidoActualString.length, 1);
    expect(pedidoActualString[0], 'Hamburguesa normal');

    final startTime = DateTime.now();

    await tester.runAsync(() async {
      _finalizarPedido(cocinero, pedidoActualString, context);
    });

    while (!pedidoCompletado) {
      await tester.pump(Duration(seconds: 1)); // Espera 1 segundo
    }

    await pedidoCompletado;
    final endTime = DateTime.now();

    final totalTime = endTime.difference(startTime);
    expect(totalTime, Duration(seconds: 5)); // Verificar que el tiempo son 5 segundos
  });
}

// Define una función simulada de _finalizarPedido para facilitar la prueba
void _finalizarPedido(Cocinero cocinero, List<String> pedidoActual, BuildContext context) async{
  // Copia _finalizarPedido
  Future.delayed(Duration(seconds: 5), () {
    cocinero.cocinaPedido(pedidoActual, context);
    pedidoCompletado();
  });
}

void pedidoCompletado(){
  pedidoCompletado = true;
}
