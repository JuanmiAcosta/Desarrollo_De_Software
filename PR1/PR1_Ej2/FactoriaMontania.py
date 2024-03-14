from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from CarreraMontania import CarreraMontania
from BicicletaMontania import BicicletaMontania
class FactoriaMontania(FactoriaCarreraYBicicleta):

    def crearCarrera(self):
        return CarreraMontania()

    def crearBicicleta(self):
        return BicicletaMontania()