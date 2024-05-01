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
import 'package:flutter/src/widgets/framework.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/TerminalPedidos.dart';


void main() {

  group('Observador Pedidos', () {
    late HamburguesaNormalBuilder normalBuilder;
    late HamburguesaVeganaBuilder veganaBuilder ;
    late HamburguesaSinGlutenBuilder sinGlutenBuilder;
    late Pedido pedidoactual ;
    late Cocinero cocinero ;
    late DisplayPedidos displayPedidos;
    late TerminalPedidos terminalPedidos;


    setUp(() {
      normalBuilder = HamburguesaNormalBuilder();
      veganaBuilder = HamburguesaVeganaBuilder();
      sinGlutenBuilder = HamburguesaSinGlutenBuilder();
      pedidoactual = Pedido();
      cocinero = Cocinero();
      displayPedidos = DisplayPedidos();
      terminalPedidos = TerminalPedidos();
    });

    test('Añadimos observador al cocinero', () {
      cocinero.attach(displayPedidos);
      expect(cocinero.observers.length, 1);
    });

    test('Eliminamos observador al cocinero', () {
      cocinero.attach(displayPedidos);
      cocinero.detach(displayPedidos);
      expect(cocinero.observers.length, 0);
    });

    test('Se notifica correctamente', () {
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.attach(displayPedidos);
      cocinero.buildHamburguesa();
      cocinero.notify(null);
      expect(displayPedidos.historial.length, 1);
    });

    test('Se notifica correctamente a los distintos tipos de observers', () {
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.attach(displayPedidos);
      cocinero.attach(terminalPedidos);
      cocinero.buildHamburguesa();
      cocinero.notify(null);
      expect(displayPedidos.historial.length, 1);
      expect(terminalPedidos.historial.length, 1);
    });

    test('Pedido notificado es correcto', () {
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.attach(displayPedidos);
      cocinero.buildHamburguesa();
      pedidoactual = cocinero.pedidoActual;
      cocinero.notify(null);
      expect(displayPedidos.historial[0], pedidoactual);
    });




  });
}
