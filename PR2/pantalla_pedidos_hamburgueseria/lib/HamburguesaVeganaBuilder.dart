import 'HamburguesaBuilder.dart';
import 'Hamburguesa.dart';


class HamburguesaVeganaBuilder extends HamburguesaBuilder {
  @override
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