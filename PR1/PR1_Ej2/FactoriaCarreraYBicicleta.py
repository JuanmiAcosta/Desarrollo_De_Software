from abc import ABC, abstractmethod

class FactoriaCarreraYBicicleta(ABC):
    @abstractmethod
    def crearCarrera(self):
        pass

    def crearBicicleta(self,id):
        pass