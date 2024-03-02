from Bicicleta import Bicicleta
class BicicletaCarretera(Bicicleta):
    def __init__(self,id):
        self.id=id
        self.tipo="carretera"

    def mostrarTipo(self):
        print("Soy una bici de ", self.tipo, "cond id ", self.id, "\n")

