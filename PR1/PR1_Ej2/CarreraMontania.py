from Carrera import Carrera
class CarreraMontania(Carrera):
    def __init__(self):
       self.tipo="Montaña"

    def mostrarTipo(self):
        print("Soy una carrera de tipo ", self.tipo, "\n")
