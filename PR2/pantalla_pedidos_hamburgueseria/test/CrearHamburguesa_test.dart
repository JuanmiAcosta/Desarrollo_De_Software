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
  
  group('Hamburguesas y recetas', () {

    late HamburguesaNormalBuilder normalBuilder;
    late HamburguesaVeganaBuilder veganaBuilder ;
    late HamburguesaSinGlutenBuilder sinGlutenBuilder;
    late Pedido pedidoactual ;
    late Cocinero cocinero ;

    setUp(() {
      normalBuilder= HamburguesaNormalBuilder();
      veganaBuilder = HamburguesaVeganaBuilder();
      sinGlutenBuilder= HamburguesaSinGlutenBuilder();
      pedidoactual = Pedido();
      cocinero = Cocinero();
    });

    test('Añadir receta', () {
      final cocinero = Cocinero.Parametros(normalBuilder);
      expect(cocinero.getBuilder(), normalBuilder);
    });

    test('Cambio de receta', () {
      cocinero = Cocinero.Parametros(veganaBuilder);
      cocinero.cambiaReceta(sinGlutenBuilder);
      expect(cocinero.getBuilder(), sinGlutenBuilder);
    });

    test('Comprobar queso de cabra en vegana', () { // Comprobamos que en vegana no metamos queso de cabra
      cocinero = Cocinero.Parametros(veganaBuilder);
      cocinero.buildHamburguesa();
      pedidoactual = cocinero.getPedido();
      expect(pedidoactual.hamburguesas[0].quesoCabra, null );
    });

    test('Hamburguesa normal', () {
      normalBuilder= HamburguesaNormalBuilder();
      cocinero = Cocinero.Parametros(normalBuilder);
      cocinero.buildHamburguesa();
      Pedido pedidoActual = cocinero.getPedido();
      expect(pedidoActual.listo, true);
      expect(pedidoActual.hamburguesas.length, 1);
      expect(pedidoActual.hamburguesas[0].nombre, 'Hamburguesa normal');
    });

    test('Hamburguesa vegana', () {
      HamburguesaVeganaBuilder veganaBuilder= HamburguesaVeganaBuilder();
      Cocinero cocinero = Cocinero.Parametros(veganaBuilder);
      cocinero.buildHamburguesa();
      Pedido pedidoActual = cocinero.getPedido();
      expect(pedidoActual.listo, true);
      expect(pedidoActual.hamburguesas.length, 1);
      expect(pedidoActual.hamburguesas[0].nombre, 'Hamburguesa vegana');
    });

    test('Hamburguesa sin gluten', () {
      HamburguesaSinGlutenBuilder sinGlutenBuilder= HamburguesaSinGlutenBuilder();
      Cocinero cocinero = Cocinero.Parametros(sinGlutenBuilder);
      cocinero.buildHamburguesa();
      Pedido pedidoActual = cocinero.getPedido();
      expect(pedidoActual.listo, true);
      expect(pedidoActual.hamburguesas.length, 1);
      expect(pedidoActual.hamburguesas[0].nombre, 'Hamburguesa sin gluten');
    });

  });
}
