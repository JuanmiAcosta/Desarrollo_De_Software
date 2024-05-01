
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hamburguesa &&
        other.nombre == this.nombre &&
        other.pan == this.pan &&
        other.lechuga == this.lechuga &&
        other.tomate == this.tomate &&
        other.quesoCabra == this.quesoCabra &&
        other.cebolla == this.cebolla &&
        other.pepinillos == this.pepinillos &&
        other.bacon == this.bacon &&
        other.carne == this.carne;
  }
}