from Carrera import Carrera
class CarreraCarretera(Carrera):
    def __init__(self):
        self.tipo = "Carretera"

    def mostrarTipo(self):
        print("Soy una carrera de tipo ", self.tipo, "\n")