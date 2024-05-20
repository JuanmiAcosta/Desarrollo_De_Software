import 'ObservadorPedido.dart';
import 'package:flutter/material.dart';

abstract class Subject {
  void attach(ObservadorPedido observer);
  void detach(ObservadorPedido observer);
  void notify(BuildContext context);
}