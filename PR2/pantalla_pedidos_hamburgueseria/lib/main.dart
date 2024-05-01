import 'package:flutter/material.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
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

class Inicio extends StatelessWidget  {
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
