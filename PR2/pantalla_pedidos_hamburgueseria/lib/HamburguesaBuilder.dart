import 'dart:async';
import 'Hamburguesa.dart';

abstract class HamburguesaBuilder {

  late Hamburguesa hamburguesa;

  void aniadePan();

  void aniadeLechuga();

  void aniadeTomate();

  void aniadeCebolla();

  void aniadePepinillos();

  void aniadeBacon();

  void aniadeCarne();

  void aniadePrecio();

  void sleep() {
    // Simular una pausa de 0.1 segundos
    Future.delayed(Duration(milliseconds: 100));
  }

  void sleepLong() {
    // Simular una pausa de 0.8 segundos
    Future.delayed(Duration(milliseconds: 800));
  }
}