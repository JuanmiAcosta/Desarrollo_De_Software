import 'ObservadorPedido.dart';
import 'Pedido.dart';
import 'package:flutter/material.dart';

class DisplayPedidos implements ObservadorPedido {
  List<Pedido> historial = [];

  void mostrarSnackBar(BuildContext context, String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 5), // Duración del snackbar
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void update(Pedido pedido, BuildContext context) {
    historial.add(pedido);
    mostrarSnackBar(context, 'El pedido $pedido está listo');
  }
}