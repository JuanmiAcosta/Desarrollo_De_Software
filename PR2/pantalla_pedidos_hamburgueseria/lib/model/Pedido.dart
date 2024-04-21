import 'dart:core';
import 'package:flutter/material.dart';

import 'Hamburguesa.dart';

class Pedido {
  late String idPedido;
  late List<Hamburguesa> hamburguesas;
  late double precio;
  late bool listo; // Comprobar si el pedido está listo

  Pedido() {
    idPedido = DateTime.now().toString().split('.').last;
    hamburguesas = [];
    precio = 0;
    listo = false; // por defecto false
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