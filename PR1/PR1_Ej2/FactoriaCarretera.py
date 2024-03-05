from CarreraCarretera import CarreraCarretera
from BicicletaCarretera import BicicletaCarretera
from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    def crearCarrera(self):
        return CarreraCarretera()

    def crearBicicleta(self):
        return BicicletaCarretera()
