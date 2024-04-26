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

    test('Receta normal', () {
      HamburguesaNormalBuilder normalBuilder= HamburguesaNormalBuilder();
      Cocinero cocinero = Cocinero.Parametros(normalBuilder);
      expect(cocinero.getBuilder(), equals(normalBuilder));
    });
    test('Receta vegana', () {
      HamburguesaVeganaBuilder veganaBuilder = HamburguesaVeganaBuilder();
      Cocinero cocinero = Cocinero.Parametros(veganaBuilder);
      expect(cocinero.getBuilder(), equals(veganaBuilder));
    });
    test('Receta sin gluten', () {
      HamburguesaSinGlutenBuilder sinGlutenBuilder= HamburguesaSinGlutenBuilder();
      Cocinero cocinero = Cocinero.Parametros(sinGlutenBuilder);
      expect(cocinero.getBuilder(), equals(sinGlutenBuilder));
    });

    test('Hamburguesa normal', () {
      HamburguesaNormalBuilder normalBuilder= HamburguesaNormalBuilder();
      Cocinero cocinero = Cocinero.Parametros(normalBuilder);
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
