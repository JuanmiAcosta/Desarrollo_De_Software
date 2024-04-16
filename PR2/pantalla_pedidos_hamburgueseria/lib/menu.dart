import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatefulWidget { // Necesitamos estado para actulizar el carrito
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _carritoCount = 0; // Número de artículos en el carrito
  List<Map<String, dynamic>> _hamburguesasEnCarrito = []; // Lista de hamburguesas en el carrito

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Bienvenido'),
            SizedBox(width: 8),
            IconButton( // Cambiamos el texto por un IconButton para el carrito
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                _mostrarPedido(context);
              },
            ),
            SizedBox(width: 8),
            Text('$_carritoCount'),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SizedBox(height: 20),
              _botonHamburguesa('assets/normal.jpg', "Hamburguesa normal", 5.00),
              SizedBox(height: 20),
              _botonHamburguesa("assets/normal.jpg", "Hamburguesa vegana", 5.50),
              SizedBox(height: 20),
              _botonHamburguesa("assets/normal.jpg", "Hamburguesa sin gluten", 6.00),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botonHamburguesa(String hamburguesaImagePath, String nombre, double precio){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 32.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hamburguesaImagePath),
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
          ),
          ElevatedButton(
            onPressed: () {
              _agregarAlCarrito(nombre, precio);
            },
            child: Text(
              nombre,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void mostrarSnackBar(BuildContext context, String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 1), // Duración del snackbar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _agregarAlCarrito(String hamburguesa, double precio) {
    setState(() {
      _carritoCount++;
      _hamburguesasEnCarrito.add({'nombre': hamburguesa, 'precio': precio});
    });
    mostrarSnackBar(context, "Añadiendo al pedido una $hamburguesa ...");
  }

  void _mostrarPedido(BuildContext context) {
    // Precio total del carrito
    // Fold itera sobre los elementos de una lista
    // totalAcumulado valor hasta el momento del pedido
    // Hambuguesa elemento actual de la lista
    double total = _hamburguesasEnCarrito.fold(0, (totalAcumulado, hamburguesa) => totalAcumulado + hamburguesa['precio']);
    showDialog( // Abre la bentana para mostrar las hamburguesas en el pedido
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hamburguesas en el carrito'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ..._hamburguesasEnCarrito.map((hamburguesa) {
                  return Text("${hamburguesa['nombre']}  . . . . . . .  \$${hamburguesa['precio']}");
                }).toList(), // Iteramos sobre la mista para ir mostrando las hamburguesas como texto
                SizedBox(height: 10), // Margen
                Text('Total  . . .  \$${total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold)), // Precio total
                SizedBox(height: 20), // Margen
                Center( // Centrar Finalizar pedido
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent), // Fondo rojo
                      foregroundColor: MaterialStateProperty.all(Colors.black), // Texto negro
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

  void _finalizarPedido() { // Finalizar pedido, limpiar el carito y contador
    setState(() {
      _hamburguesasEnCarrito.clear();
      _carritoCount = 0;
    });
    mostrarSnackBar(context, 'Pedido finalizado');
  }
}

