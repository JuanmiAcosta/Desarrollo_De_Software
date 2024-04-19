import 'ObservadorPedido.dart';
import 'Pedido.dart';

class DisplayPedidos implements ObservadorPedido {
  List<Pedido> historial = [];

  @override
  String update(Pedido pedido) {
    historial.add(pedido);
    return 'El pedido $pedido está listo!';
  }
}