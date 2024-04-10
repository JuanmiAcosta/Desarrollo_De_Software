import 'HamburguesaBuilder.dart';
import 'Hamburguesa.dart';

class HamburguesaNormalBuilder extends HamburguesaBuilder {
  Hamburguesa hamburguesa = Hamburguesa() ;

  @override
  void aniadePan() {
    hamburguesa.pan = "Pan normal";
    sleep();
  }

  @override
  void aniadeLechuga() {
    hamburguesa.lechuga = "Lechuga fresca";
    sleep();
  }

  @override
  void aniadeTomate() {
    hamburguesa.tomate = "Tomate pera";
    sleep();
  }

  @override
  void aniadeQuesoCabra() {
    hamburguesa.quesoCabra = "Queso de cabra recién cortado";
    sleep();
  }

  @override
  void aniadeCebolla() {
    hamburguesa.cebolla = "Cebolla llorosa";
    sleep();
  }

  @override
  void aniadePepinillos() {
    hamburguesa.pepinillos = "Pepinillos";
    sleep();
  }

  @override
  void aniadeBacon() {
    hamburguesa.bacon = "Bacon grasiento";
    sleepLong();
  }

  @override
  void aniadeCarne() {
    hamburguesa.carne = "Carne Wagyu";
    sleepLong();
  }

  @override
  void aniadePrecio() {
    hamburguesa.precio = 5;
  }
}