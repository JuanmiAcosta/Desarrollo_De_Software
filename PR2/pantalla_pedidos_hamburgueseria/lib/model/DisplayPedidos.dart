import 'ObservadorPedido.dart';
import 'Pedido.dart';
import 'package:flutter/material.dart';

class DisplayPedidos implements ObservadorPedido {
  List<Pedido> historial = [];

  late ScaffoldMessengerState _scaffoldMessengerState; // Referencia al ScaffoldMessenger
  late Function() _actualizarHistorial; // Agregar una función de actualización

  DisplayPedidos(){}

  DisplayPedidos.Parametros(this.historial, this._actualizarHistorial);

  void init(BuildContext context) {
    _scaffoldMessengerState = ScaffoldMessenger.of(context);
  }

  void mostrarSnackBar(BuildContext context, String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 5), // Duración del snackbar
      backgroundColor: Colors.redAccent,
    );
    _scaffoldMessengerState.showSnackBar(snackBar);
  }

  @override
  void update(Pedido pedido, BuildContext? context) {
    if (context != null){
      if (!_scaffoldMessengerState.mounted) {
        // Comprobar si el ScaffoldMessenger sigue montado antes de mostrar el SnackBar
        return;
      }
      mostrarSnackBar(context, 'El pedido ${pedido.idPedido}\n $pedido está listo');
      _actualizarHistorial();
    }
    historial.add(pedido);
  }

}