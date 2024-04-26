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

  List<Pedido> _historialPedidos = []; // Creamos una lista para el historial de pedidos
  late Cocinero cocinero; // Definimos la variable cocinero fuera del setUp

  group('Observador Pedidos', () {

    setUp(() {
      HamburguesaNormalBuilder normalBuilder= HamburguesaNormalBuilder();
      cocinero = Cocinero.Parametros(normalBuilder); // Inicializamos la variable cocinero
    });

    test('Observando creacion del pedido', () {
      DisplayPedidos display = DisplayPedidos(_historialPedidos, () => null);// Inicializa DisplayPedidos con el BuildContext válido
      cocinero.attach(display);
      cocinero.buildHamburguesa();
      Pedido pedidoActual = cocinero.getPedido();
      
      //expect(display.historial, );
    });
  });
}
