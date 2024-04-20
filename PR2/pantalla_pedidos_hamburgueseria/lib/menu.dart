import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/Cocinero.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaNormalBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaSinGlutenBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaVeganaBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/ObservadorPedido.dart';
import 'model/Pedido.dart';
import 'model/Hamburguesa.dart';
import 'model/DisplayPedidos.dart';

class Menu extends StatefulWidget {
  // Necesitamos estado para actulizar el carrito
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  DisplayPedidos _display = DisplayPedidos();
  Pedido _pedido = Pedido();
  int _cantidad = 0;
  List<Hamburguesa> _hamburguesas = [];
  Cocinero _cocinero = Cocinero();

  List<String> _pedidoActual = [];

  @override
  void initState(){
    super.initState();
    _cocinero.attach(_display);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Bienvenido'),
            SizedBox(width: 8),
            IconButton(
              // Cambiamos el texto por un IconButton para el carrito
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                _mostrarPedido(context);
              },
            ),
            SizedBox(width: 8),
            Text('$_cantidad'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpg'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajuste de la imagen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _botonHamburguesa(
                  'assets/normal.jpg', "Hamburguesa normal", 5.00),
              SizedBox(height: 20),
              _botonHamburguesa(
                  "assets/vegana.jpg", "Hamburguesa vegana", 5.50),
              SizedBox(height: 20),
              _botonHamburguesa(
                  "assets/singluten.jpg", "Hamburguesa sin gluten", 6.00),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botonHamburguesa(
      String hamburguesaImagePath, String nombre, double precio) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 32.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hamburguesaImagePath),
                fit: BoxFit.fitHeight,
              ),
            ),
            height: 150,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child : ElevatedButton(
              onPressed: () {
                _agregarAlCarrito(nombre);
              },
              child: Text(
                nombre,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getPedidoActual(){
    setState(() {
      _pedido = _cocinero.getPedido();
      _hamburguesas = _pedido.getHamburguesas();
      _cantidad = _pedido.getHamburguesas().length;
    });
  }

  void mostrarSnackBar(BuildContext context, String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2), // Duración del snackbar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _agregarAlCarrito(String hamburguesa) {
    setState(() {
      /* OLD CODE !!
      if(hamburguesa == "Hamburguesa normal"){
        _cocinero.cambiaReceta(HamburguesaNormalBuilder());
      }else if(hamburguesa == "Hamburguesa vegana"){
        _cocinero.cambiaReceta(HamburguesaVeganaBuilder());
      }else if(hamburguesa == "Hamburguesa sin gluten"){
        _cocinero.cambiaReceta(HamburguesaSinGlutenBuilder());
      }
      _cocinero.buildHamburguesa();
      getPedidoActual();//Actualizamos valores de pedido
      */
      this._pedidoActual.add(hamburguesa);
    });
    mostrarSnackBar(context, "Añadiendo al pedido una $hamburguesa ...");
  }

  void _mostrarPedido(BuildContext context) {
    // Precio total del carrito
    // Fold itera sobre los elementos de una lista
    // totalAcumulado valor hasta el momento del pedido
    // Hambuguesa elemento actual de la lista
    double total = _hamburguesas.fold(
        0,
        (totalAcumulado, hamburguesa) =>
            totalAcumulado + hamburguesa.getPrecio());
    showDialog(
      // Abre la bentana para mostrar las hamburguesas en el pedido
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hamburguesas en el carrito'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._hamburguesas.map((hamburguesa) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Distribuye los elementos a lo largo del espacio disponible
                    children: [
                      Text("${hamburguesa.getNombre()}"),
                      Text("${hamburguesa.getPrecio()}\€"),
                    ],
                  );
                }).toList(), // Precio total
                SizedBox(height: 20), // Margen
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Total:  '),
                    Text('${total.toStringAsFixed(2)}\€',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Center(
                  // Centrar Finalizar pedido
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.redAccent), // Fondo rojo
                      foregroundColor: MaterialStateProperty.all(
                          Colors.black), // Texto negro
                    ),
                    child: Text('Finalizar Pedido'),
                    onPressed: () {
                      _finalizarPedido();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  void _finalizarPedido() {
    // Finalizar pedido, limpiar el carrito y contador
    mostrarSnackBar(context, _comprobarPedido());
    setState(() {
      _hamburguesas.clear();
      _cantidad=0;
    });

  }

  String _comprobarPedido(){
    if(_cocinero.getPedido().getHamburguesas().isEmpty){
      return "El pedido actualmente se encuentra vacio";
    }else{
      return _cocinero.notify();
    }
  }
}
