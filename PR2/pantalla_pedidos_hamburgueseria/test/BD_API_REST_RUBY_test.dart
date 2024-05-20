import 'package:flutter_test/flutter_test.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/Cocinero.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaNormalBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaSinGlutenBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaVeganaBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/Pedido.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/DisplayPedidos.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/TerminalPedidos.dart';


void main() {

  group('Probando Backend-Frontend', () {
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

    test('Probando inserción en BD', () {
      cocinero.attach(displayPedidos);
      expect(cocinero.observers.length, 1);
    });

  });
}
