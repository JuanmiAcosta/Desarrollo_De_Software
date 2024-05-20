import 'ObservadorPedido.dart';
import 'Pedido.dart';
import 'package:flutter/material.dart';

class TerminalPedidos implements ObservadorPedido {
  List<Pedido> historial = [];

  late Function() _actualizarHistorial; // Agregar una función de actualización

  TerminalPedidos(){}

  TerminalPedidos.Parametros(this.historial, this._actualizarHistorial);

  @override
  void update(Pedido pedido, BuildContext? context) {
    if (context != null){
      _actualizarHistorial();
    }
    historial.add(pedido);
    print('El pedido ${pedido.idPedido}\n $pedido está listo');
  }

}