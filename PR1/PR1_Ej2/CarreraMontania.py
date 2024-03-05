from Carrera import Carrera
from random import *
import time
import math

class CarreraMontania(Carrera):
    def __init__(self):
       self.participantes = []
       self.tipo="Montaña"

    def mostrarTipo(self):
        print("Soy una carrera de tipo ", self.tipo, "\n")

    def run(self, bici):
        print("Comienza la carrera de montania\n")

        num_bicis = randint(10, 20)

        for i in range(num_bicis):
            clone = bici.clone()
            self.aniadirBici(clone)

        print("Estan listas las ", num_bicis, " para la carrera de montania\n")

        time.sleep(4)

        veinte_por = math.floor(num_bicis * 0.2)
        retiradas = []

        for i in range (veinte_por):
            bici_aleatoria = randint(0,num_bicis-i-1)
            self.getParticipantes().pop(bici_aleatoria)
            retiradas.append(bici_aleatoria)

        print("Se retiraron las bicis de montania numero")
        for i in range(veinte_por):
            print ("\t", retiradas[i])

        time.sleep(6)
        print("\nCarrera de montania terminada\n")

