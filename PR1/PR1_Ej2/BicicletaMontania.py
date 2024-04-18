from Bicicleta import Bicicleta
import copy

class BicicletaMontania(Bicicleta):
    def __init__(self):
        self.tipo="Montania"

    def mostrarTipo(self):
        print("Soy una bici de ", self.tipo,"\n")

    def clone(self):
        return copy.deepcopy(self)