import 'ObservadorPedido.dart';
import 'Pedido.dart';

class DisplayPedidos implements ObservadorPedido {
  List<Pedido> historial = [];

  @override
  void update(Pedido pedido) {
    historial.add(pedido);
    print('El pedido $pedido está listo!');
  }
}