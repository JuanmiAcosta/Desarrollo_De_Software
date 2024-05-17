import 'dart:core';
import 'package:flutter/material.dart';

import 'Hamburguesa.dart';

class Pedido {
  late String? idPedido;
  late List<Hamburguesa> hamburguesas;
  late double precio;
  late bool listo; // Comprobar si el pedido está listo

  Pedido() {
    idPedido = DateTime.now().toString().split('.').last;
    hamburguesas = [];
    precio = 0.0;
    listo = false; // por defecto false
  }

  Pedido.json({
    this.idPedido,
    List<Hamburguesa>? hamburguesas,
    double? precio,
    bool? listo,
  })  : hamburguesas = hamburguesas ?? [],
        precio = precio ?? 0.0,
        listo = listo ?? false;

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido.json(
      idPedido: json['idPedido'] as String?,
      hamburguesas: (json['hamburguesas'] as List<dynamic>?)
          ?.map((e) => Hamburguesa.fromJson(e as Map<String, dynamic>))
          .toList(),
      precio: (json['precio'] as num?)?.toDouble(),
      listo: json['listo'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (idPedido != null) 'idPedido': idPedido,
      if (hamburguesas.isNotEmpty) 'hamburguesas': hamburguesas.map((e) => e.toJson()).toList(),
      'precio': precio,
      'listo': listo,
    };
  }

  void aniadeHamburguesa(Hamburguesa hamburguesa) {
    hamburguesas.add(hamburguesa);
    precio += hamburguesa.getPrecio()!;
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