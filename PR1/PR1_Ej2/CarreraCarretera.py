from Carrera import Carrera
import time

class CarreraCarretera(Carrera):
    def __init__(self):
        self.tipo = "Carretera"

    def mostrarTipo(self):
        print("Soy una carrera de tipo ", self.tipo, "\n")

    def run(self):

