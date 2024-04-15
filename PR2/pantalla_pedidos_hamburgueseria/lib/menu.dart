import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 32.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 80)),
                  ),
                  child: Text("Hamburguesa normal"),
                  onPressed: () {
                    mostrarSnackBar(context,
                        "Añadiendo al pedido una hamburguesa normal ...");
                  },
                ),
              ),
              SizedBox(height: 20), // Espacio entre los botones
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 32.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 80)),
                  ),
                  child: Text("Hamburguesa vegana"),
                  onPressed: () {
                    mostrarSnackBar(context,
                        "Añadiendo al pedido una hamburguesa vegana ...");
                  },
                ),
              ),
              SizedBox(height: 20), // Espacio entre los botones
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 32.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 80)),
                  ),
                  child: Text("Hamburguesa sin gluten"),
                  onPressed: () {
                    mostrarSnackBar(context,
                        "Añadiendo al pedido una hamburguesa sin gluten ...");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void mostrarSnackBar(BuildContext context, String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2), // Duración del snackbar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
