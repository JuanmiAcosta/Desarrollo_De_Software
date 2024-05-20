import 'Pedido.dart';
import 'package:flutter/material.dart';

abstract class ObservadorPedido {
  void update(Pedido pedido, BuildContext? context);
}

