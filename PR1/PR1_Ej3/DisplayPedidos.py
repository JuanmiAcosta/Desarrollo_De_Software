from ObservadorPedido import ObservadorPedido
import os
class DisplayPedidos(ObservadorPedido):
    def __init__(self):
        self.historial = []
        if os.path.exists("historial.txt"):
            os.remove("historial.txt")
        self.f = open("historial.txt", "x")
        self.f.close()

    def update(self, pedido):
        self.historial.append(pedido)
        print(f"\nEl pedido {pedido.idPedido} está listo!")
        self.saveToTxT(pedido)

    def saveToTxT(self, pedido):
        self.f = open("historial.txt", "a")
        self.f.write(pedido.__str__())
        self.f.close()