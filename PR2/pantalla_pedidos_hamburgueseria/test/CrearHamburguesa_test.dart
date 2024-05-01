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

    test('Se añaden hamburguesas al pedido', () {
      normalBuilder = HamburguesaNormalBuilder();
      cocinero = Cocinero.Parametros(normalBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(sinGlutenBuilder);
      cocinero.buildHamburguesa();
      pedidoactual = cocinero.getPedido();
      expect(pedidoactual.hamburguesas.length, 3);
    });

    test('Se crea de forma correcta la hamburguesa', () {
      Cocinero cocinero = Cocinero.Parametros(normalBuilder);
      cocinero.buildHamburguesa();
      HamburguesaNormalBuilder normalBuilder2 = HamburguesaNormalBuilder();
      normalBuilder2.aniadePan();
      normalBuilder2.aniadeLechuga();
      normalBuilder2.aniadeTomate();
      normalBuilder2.aniadeQuesoCabra();
      normalBuilder2.aniadeCebolla();
      normalBuilder2.aniadePepinillos();
      normalBuilder2.aniadeBacon();
      normalBuilder2.aniadeCarne();
      normalBuilder2.aniadePrecio();
      expect(cocinero.pedidoActual.hamburguesas[0], normalBuilder2.hamburguesa);
    });

    test('Precio de pedido es correcto', () {
      cocinero = Cocinero.Parametros(sinGlutenBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(normalBuilder);
      cocinero.buildHamburguesa();
      pedidoactual = cocinero.getPedido();
      expect(pedidoactual.getPrecio(), sinGlutenBuilder.hamburguesa.precio+veganaBuilder.hamburguesa.precio+normalBuilder.hamburguesa.precio);
    });

  });
}
