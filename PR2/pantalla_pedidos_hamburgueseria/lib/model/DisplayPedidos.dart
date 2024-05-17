import 'ObservadorPedido.dart';
import 'Pedido.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DisplayPedidos implements ObservadorPedido {
  List<Pedido> historial = [];
  final String apiUrl = "http://localhost:3000/pedidos";

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

  //Parte API Rest
  Future<void> cargarPedidos(String usuarios) async {
    final response = http.get(Uri.parse('$apiUrl?usuario=$usuario'));
    if (response.statusCode == 200) {
      List<dynamic> pedidosJson = json.decode(respose.body);

      historial.clear();
      historial.addAll(pedidosJson.map((json) => Pedido.fromJson(json)).toList());
    } else {
      throw Exception('Fallo al cargar pedidos');
    }
  }


}