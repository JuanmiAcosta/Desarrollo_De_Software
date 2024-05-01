import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaSinGlutenBuilder.dart';
import 'package:pantalla_pedidos_hamburgueseria/model/HamburguesaVeganaBuilder.dart';

import 'package:flutter/material.dart';

import 'HamburguesaNormalBuilder.dart';
import 'ObservadorPedido.dart';
import 'Subject.dart';
import 'Pedido.dart';
import 'HamburguesaBuilder.dart';
import 'Hamburguesa.dart';

class Cocinero implements Subject {
  late HamburguesaBuilder _builder;
  String status = "Tomando pedido";
  List<ObservadorPedido> observers = [];
  Pedido pedidoActual = Pedido();

  Cocinero(){}

  Cocinero.Parametros(HamburguesaBuilder builder) {
    _builder = builder;
  }

  Future<void> cocinaPedido(List<String> hamburguesas, BuildContext context) async{
    for (String hamburguesa in hamburguesas) {
      switch (hamburguesa) {
        case "Hamburguesa normal":
          {
            cambiaReceta(HamburguesaNormalBuilder());
          }
          break;

        case "Hamburguesa vegana":
          {
            cambiaReceta(HamburguesaVeganaBuilder());
          }
          break;

        case "Hamburguesa sin gluten":
          {
            cambiaReceta(HamburguesaSinGlutenBuilder());
          }
          break;

        default:
          throw Exception("Tipo de hamburguesa no válido");
      }
      await buildHamburguesa(); // Esperar a que se cocine la hamburguesa actual antes de continuarbuildHamburguesa();
    }
    notify(context);
  }

  Future<void> buildHamburguesa() async {
    status = "Cocinando";

    _builder.aniadePan();
    _builder.aniadeLechuga();
    _builder.aniadeTomate();
    if (_builder is HamburguesaNormalBuilder) {
      (_builder as HamburguesaNormalBuilder).aniadeQuesoCabra();
    }
    _builder.aniadeCebolla();
    _builder.aniadePepinillos();
    _builder.aniadeBacon();
    _builder.aniadeCarne();
    _builder.aniadePrecio();

    pedidoActual.aniadeHamburguesa(_builder.hamburguesa);
    pedidoActual.listo = true; // cambiar a true el pedido si esta listo
    status = "Tomando pedido";
  }

  void cambiaReceta(HamburguesaBuilder builder) {
    _builder = builder;
  }

  Pedido getPedido(){
    return this.pedidoActual;
  }

  HamburguesaBuilder getBuilder(){
    return this._builder;
  }

  @override
  void attach(ObservadorPedido observer) {
    observers.add(observer);
  }

  @override
  void detach(ObservadorPedido observer) {
    observers.remove(observer);
  }

  @override
  void notify(BuildContext? context) {
    for (var notified in observers) {
       notified.update(pedidoActual, context);
    }
    pedidoActual = Pedido();
  }
}