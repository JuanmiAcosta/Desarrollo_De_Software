import 'package:flutter/material.dart';
import 'menu.dart';
import 'model/DisplayPedidos.dart';
import 'model/Cocinero.dart';
import 'model/HamburguesaNormalBuilder.dart';
import 'model/HamburguesaSinGlutenBuilder.dart';
import 'model/HamburguesaVeganaBuilder.dart';

void main() {
  runApp(const MyApp());

  //Ceramos la "pantalla"
  DisplayPedidos display = DisplayPedidos();

  //Instanciamos uno de los builder, el de hamurguesa normal
  HamburguesaNormalBuilder normal = HamburguesaNormalBuilder();

  //Le pasamos la "receta al cocinero
  Cocinero cocinero = Cocinero(normal);
  cocinero.attach(
      display); // Si hubiera más de una pantalla para pedir pedidos le añadiríamos otra

  //Si terminamos el pedido el cocinero comenzará a construirla (Imaginamos que hemos pedido dos hamburguesas normales)
  cocinero.buildHamburguesa();
  cocinero.buildHamburguesa();

  //Alertamos al display (el suscriber)
  cocinero.notify(); //Esto muestra en la terminal tb el pedido listo
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PR2 DS',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
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
                  child: Text("Para llevar"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Menu()),
                    );
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
                  child: Text("Para tomar aquí"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Menu()),
                    );
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
                  child: Text("Cambiar idioma"),
                  onPressed: () {
                    mostrarSnackBar(
                        context, "En este momento no es posible ...");
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
