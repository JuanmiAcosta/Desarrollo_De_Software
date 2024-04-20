import 'HamburguesaBuilder.dart';
import 'Hamburguesa.dart';


class HamburguesaVeganaBuilder extends HamburguesaBuilder {
  @override
  Hamburguesa hamburguesa = Hamburguesa() ;

  HamburguesaVeganaBuilder(){
    this.hamburguesa.nombre = "Hamburguesa vegana";
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
    hamburguesa.bacon = "Bacon Vegano reseco";
    sleepLong();
  }

  @override
  void aniadeCarne() {
    hamburguesa.carne = "Carne Vegana de dudosa procedencia";
    sleepLong();
  }

  @override
  void aniadePrecio() {
    hamburguesa.precio = 5.5;
  }
}