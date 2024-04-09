import 'ObservadorPedido.dart';

abstract class Subject {
  void attach(ObservadorPedido observer);
  void detach(ObservadorPedido observer);
  void notify();
}