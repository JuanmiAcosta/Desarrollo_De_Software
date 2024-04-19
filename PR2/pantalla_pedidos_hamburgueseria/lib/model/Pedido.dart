import 'dart:core';
import 'Hamburguesa.dart';

class Pedido {
  late String idPedido;
  late List<Hamburguesa> hamburguesas;
  late double precio;

  Pedido() {
    idPedido = DateTime.now().toString().split('.').last;
    hamburguesas = [];
    precio = 0;
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