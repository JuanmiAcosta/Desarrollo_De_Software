from Carrera import Carrera
from random import *
import time
import math

class CarreraCarretera(Carrera):
    def __init__(self):
        self.participantes = []
        self.tipo = "Carretera"

    def mostrarTipo(self):
        print("Soy una carrera de tipo ", self.tipo, "\n")

    def run(self, bici):
        print("Comienza la carrera de carretera\n")

        num_bicis = randint(10, 20)

        for i in range(num_bicis):
            clone = bici.clone()
            self.aniadirBici(clone)

        print("Estan listas las " , num_bicis, " para la carrera de carretera\n")

        time.sleep(6)

        diez_por = math.ceil(num_bicis * 0.1)
        retiradas = []

        for i in range(diez_por):
            bici_aleatoria = randint(0, num_bicis - i -1)
            self.getParticipantes().pop(bici_aleatoria)
            retiradas.append(bici_aleatoria)

        print("Se retiraron las bicis de carretera numero")
        for i in range(diez_por):
            print("\t", retiradas[i])

        time.sleep(4)
        print("\nCarrera de carretera terminada\n")

