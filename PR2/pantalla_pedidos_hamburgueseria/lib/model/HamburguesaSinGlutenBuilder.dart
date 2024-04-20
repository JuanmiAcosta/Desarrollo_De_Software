import 'HamburguesaBuilder.dart';
import 'Hamburguesa.dart';

class HamburguesaSinGlutenBuilder extends HamburguesaBuilder {
  @override
  Hamburguesa hamburguesa = Hamburguesa();

  HamburguesaSinGlutenBuilder(){
    this.hamburguesa.nombre = "Hamburguesa sin gluten";
  }


  @override
  void aniadePan() {
    hamburguesa.pan = "Pan sin gluten";
    sleepLong();
  }

  @override
  void aniadeLechuga() {
    hamburguesa.lechuga = "Lechuga verde";
    sleepLight();
  }

  @override
  void aniadeTomate() {
    hamburguesa.tomate = "Tomate pera";
    sleepLight();
  }

  @override
  void aniadeQuesoCabra() {
    hamburguesa.quesoCabra = "Queso de cabra (sin trazas)";
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
    hamburguesa.carne = "Carne Wagyu (sin trazas)";
    sleepLong();
  }

  @override
  void aniadePrecio() {
    hamburguesa.precio = 6;
  }
}