import datetime
import time
class Pedido:
    def __init__(self):
        self.idPedido = time.strftime('%H%M%S', time.localtime())
        self.hamburguesas = []

    def aniadeHamburguesa(self, hamburguesa):
        self.hamburguesas.append(hamburguesa)

    def __str__(self):
        cadena = f"\nPedido {self.idPedido}:\n"
        index = 1
        for hamburguesa in self.hamburguesas:
            if index==1:
                cadena= cadena + f"\tHamburguesa {index}: {hamburguesa.__str__()}"
            else:
                cadena= cadena+f"\n\tHamburguesa {index}: {hamburguesa.__str__()}"
            index+=1
        return cadena