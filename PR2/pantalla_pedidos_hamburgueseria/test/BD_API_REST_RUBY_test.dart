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

    test('Probando insert en BD', () async {
      cocinero.attach(displayPedidos);
      cocinero = Cocinero.Parametros(normalBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(sinGlutenBuilder);
      cocinero.buildHamburguesa();
      pedidoactual = cocinero.getPedido();
      print(pedidoactual.hamburguesas.length);
      await displayPedidos.agregar(pedidoactual);
      String? idUltimoInsertado = displayPedidos.historial.last.idPedido;
      expect(idUltimoInsertado, pedidoactual.idPedido) ;
    });

    test('Probando update en BD', () async {
      cocinero.attach(displayPedidos);
      cocinero = Cocinero.Parametros(normalBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(sinGlutenBuilder);
      cocinero.buildHamburguesa();
      pedidoactual = cocinero.getPedido();
      print(pedidoactual.hamburguesas.length);
      await displayPedidos.agregar(pedidoactual);
      Pedido? ultimoInsertado = displayPedidos.historial.last;
      expect(ultimoInsertado.listo, false);
      await displayPedidos.marcarFinalizado(ultimoInsertado);
      expect(ultimoInsertado.listo, true);
    });

    test('Probando eliminar en BD', () async {
      cocinero.attach(displayPedidos);
      cocinero = Cocinero.Parametros(normalBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(veganaBuilder);
      cocinero.buildHamburguesa();
      cocinero.cambiaReceta(sinGlutenBuilder);
      cocinero.buildHamburguesa();
      pedidoactual = cocinero.getPedido();
      print(pedidoactual.hamburguesas.length);
      await displayPedidos.agregar(pedidoactual);
      int numPedidos = displayPedidos.historial.length;
      Pedido? ultimoInsertado = displayPedidos.historial.last;
      await displayPedidos.eliminar(ultimoInsertado);
      int numPedidosDespuesEliminar = displayPedidos.historial.length;
      expect(numPedidos-1, numPedidosDespuesEliminar);
    });

  });
}
