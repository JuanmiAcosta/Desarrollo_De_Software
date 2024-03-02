from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from CarreraCarretera import CarreraCarretera
from BicicletaCarretera import BicicletaCarretera
class FactoriaCarretera(FactoriaCarreraYBicicleta):
    def crearCarrera(self):
        return CarreraCarretera()

    def crearBicicleta(self,id):
        return BicicletaCarretera(id)
