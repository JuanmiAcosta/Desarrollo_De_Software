import 'dart:async';
import 'Hamburguesa.dart';
import 'dart:io'; // For sleep
import 'dart:async';

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

  void sleepLight() {
    // Simular una pausa
    sleep(const Duration(milliseconds: 100)); // Espera síncrona
    //await Future.delayed(Duration(seconds: 1)); // Espera asíncrona
  }

  void sleepLong() {
    // Simular una pausa de 2 segundos
    // Future.delayed(const Duration(milliseconds: 2000));
    sleep(const Duration(milliseconds: 200));
  }
}