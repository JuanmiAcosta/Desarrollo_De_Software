from Bicicleta import Bicicleta
import copy

class BicicletaCarretera(Bicicleta):
    def __init__(self):
        self.tipo="carretera"

    def mostrarTipo(self):
        print("Soy una bici de ", self.tipo,"\n")

    def clone(self):
        return copy.copy(self)


