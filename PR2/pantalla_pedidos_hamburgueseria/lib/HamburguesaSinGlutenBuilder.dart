import 'HamburguesaBuilder.dart';
import 'Hamburguesa.dart';

class HamburguesaSinGlutenBuilder extends HamburguesaBuilder {
  @override
  Hamburguesa hamburguesa = Hamburguesa();

  @override
  void aniadePan() {
    hamburguesa.pan = "Pan sin gluten";
    sleepLong();
  }

  @override
  void aniadeLechuga() {
    hamburguesa.lechuga = "Lechuga verde";
    sleep();
  }

  @override
  void aniadeTomate() {
    hamburguesa.tomate = "Tomate pera";
    sleep();
  }

  @override
  void aniadeQuesoCabra() {
    hamburguesa.quesoCabra = "Queso de cabra (sin trazas)";
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
    hamburguesa.carne = "Carne Wagyu (sin trazas)";
    sleepLong();
  }

  @override
  void aniadePrecio() {
    hamburguesa.precio = 6;
  }
}