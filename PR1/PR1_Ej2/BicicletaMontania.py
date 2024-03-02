from Bicicleta import Bicicleta
class BicicletaMontania(Bicicleta):
    def __init__(self,id):
        self.id=id
        self.tipo="Montania"

    def mostrarTipo(self):
        print("Soy una bici de ", self.tipo, "cond id ", self.id, "\n")