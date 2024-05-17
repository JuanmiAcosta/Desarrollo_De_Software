import 'dart:core';
import 'package:flutter/material.dart';

import 'Hamburguesa.dart';

class Pedido {
  late String? idPedido;
  late List<Hamburguesa>? hamburguesas;
  late double? precio;
  late bool? listo; // Comprobar si el pedido está listo

  Pedido() {
    idPedido = DateTime.now().toString().split('.').last;
    hamburguesas = [];
    precio = 0;
    listo = false; // por defecto false
  }

  Pedido.json({
    this.idPedido,
    this.hamburguesas,
    this.precio,
    this.listo
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido.json(
      idPedido: json['idPedido'] as String?,
      hamburguesas: (json['hamburguesas'] as List<dynamic>?)
          ?.map((e) => Hamburguesa.fromJson(e as Map<String, dynamic>))
          .toList(),
      precio: json['precio'] as double?,
      listo: json['listo'] as bool?,
    );
  }

  void aniadeHamburguesa(Hamburguesa hamburguesa) {
    hamburguesas.add(hamburguesa);
    precio += hamburguesa.precio;
  }

  double getPrecio(){
    return this.precio;
  }

  List<Hamburguesa> getHamburguesas(){
    return this.hamburguesas;
  }


  @override
  String toString() {
    String cadena = "\nPedido $idPedido:\n";
    int index = 1;
    for (var hamburguesa in hamburguesas) {
      if (index == 1) {
        cadena += "\tHamburguesa $index: ${hamburguesa.toString()} Precio ${hamburguesa.precio}";
      } else {
        cadena += "\n\tHamburguesa $index: ${hamburguesa.toString()} Precio ${hamburguesa.precio}";
      }
      index++;
    }
    cadena += "\n\tTotal $precio€";
    return cadena;
  }
}