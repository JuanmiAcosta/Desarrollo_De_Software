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


void main() {

  group('Observador Pedidos', () {
    late HamburguesaNormalBuilder normalBuilder;
    late HamburguesaVeganaBuilder veganaBuilder ;
    late HamburguesaSinGlutenBuilder sinGlutenBuilder;
    late Pedido pedidoactual ;
    late Cocinero cocinero ;
    late DisplayPedidos displayPedidos;


    setUp(() {
      normalBuilder = HamburguesaNormalBuilder();
      veganaBuilder = HamburguesaVeganaBuilder();
      sinGlutenBuilder = HamburguesaSinGlutenBuilder();
      pedidoactual = Pedido();
      cocinero = Cocinero();
      displayPedidos = DisplayPedidos();
    });

    test('Añadimos observador al cocinero', () {
      cocinero.attach(displayPedidos);
      expect(cocinero.observers.length, 1);
    });

    test('Se notifica correctamente', () {
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.buildHamburguesa();
      cocinero.notify(null);
    });

  });
}
