import 'HamburguesaBuilder.dart';
import 'Hamburguesa.dart';

class HamburguesaNormalBuilder extends HamburguesaBuilder {
  @override
  Hamburguesa hamburguesa = Hamburguesa() ;

  HamburguesaNormalBuilder(){
    this.hamburguesa.nombre = "Hamburguesa normal";
  }

  @override
  void aniadePan() {
    hamburguesa.pan = "Pan normal";
    sleepLight();
  }

  @override
  void aniadeLechuga() {
    hamburguesa.lechuga = "Lechuga fresca";
    sleepLight();
  }

  @override
  void aniadeTomate() {
    hamburguesa.tomate = "Tomate pera";
    sleepLight();
  }

  @override
  void aniadeQuesoCabra() {
    hamburguesa.quesoCabra = "Queso de cabra recién cortado";
    sleepLight();
  }

  @override
  void aniadeCebolla() {
    hamburguesa.cebolla = "Cebolla llorosa";
    sleepLight();
  }

  @override
  void aniadePepinillos() {
    hamburguesa.pepinillos = "Pepinillos";
    sleepLight();
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