
class Hamburguesa {
  String? pan;
  String nombre="";
  String? lechuga;
  String? tomate;
  String? quesoCabra;
  String? cebolla;
  String? pepinillos;
  String? bacon;
  String? carne;
  double precio = 0;

  double getPrecio(){
    return this.precio;
  }

  String getNombre(){
    return this.nombre;
  }

  @override
  String toString() {
    String ingredientes = '';

    if (pan != null) {
      ingredientes += '$pan';
    }
    if (lechuga != null) {
      ingredientes += ' $lechuga,';
    }
    if (tomate != null) {
      ingredientes += ' $tomate,';
    }
    if (quesoCabra != null) {
      ingredientes += ' $quesoCabra,';
    }
    if (cebolla != null) {
      ingredientes += ' $cebolla,';
    }
    if (pepinillos != null) {
      ingredientes += ' $pepinillos,';
    }
    if (bacon != null) {
      ingredientes += ' $bacon,';
    }
    if (carne != null) {
      ingredientes += ' $carne.';
    }

    return ingredientes;
  }
}