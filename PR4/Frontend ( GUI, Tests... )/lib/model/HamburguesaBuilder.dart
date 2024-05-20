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

  void sleepLight() async{
    // Simular una pausa
    await Future.delayed(Duration(seconds: 7)); // Espera asíncrona
  }

  void sleepLong() async{
    await Future.delayed(const Duration(seconds: 10));
  }
}